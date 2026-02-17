# 1. ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"
}

# Fetch the fresh amazon linux 2 (ECS optimized AMI)
data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 2. EC2 Instance 
resource "aws_instance" "ecs_host" {
  ami                         = data.aws_ami.ecs_optimized.id # ECS-Optimized AMI
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.ecs_sg_id]
  associate_public_ip_address = true

  # Team provided: Using the instance-profile to allow ECR image pull
  iam_instance_profile = "ecsInstanceProfile"
  # for troubleshooting
  key_name             = var.key_name

  # Registers this specific EC2 into your ECS Cluster
  user_data = <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${aws_ecs_cluster.main.name} >> /etc/ecs/ecs.config
    EOF

  tags = { Name = "${var.project_name}-ecs-host" }
}

# 3. Task Definition
resource "aws_ecs_task_definition" "strapi" {
  family                   = var.project_name
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "512"
  memory                   = "1024"

  container_definitions = jsonencode([
    {
      name         = "strapi-container"
      image        = var.ecr_image_url
      essential    = true
      portMappings = [{ containerPort = 1337, hostPort = 1337 }]
      environment = [
        { name = "DATABASE_CLIENT", value = "postgres" },
        { name = "DATABASE_HOST", value = var.db_host },
        { name = "DATABASE_PORT", value = "5432" },
        { name = "DATABASE_NAME", value = var.db_name },
        { name = "DATABASE_USERNAME", value = var.db_username },
        { name = "DATABASE_PASSWORD", value = var.db_password },
        { name = "NODE_ENV", value = "production" },
        { name = "APP_KEYS", value = "testKey1,testKey2" },
        { name = "API_TOKEN_SALT", value = "testSalt" },
        { name = "ADMIN_JWT_SECRET", value = "testSecret" },
        { name = "TRANSFER_TOKEN_SALT", value = "testTransfer" },
        { name = "JWT_SECRET", value = "anotherTestSecret" }
      ]
    }
  ])
}

# 4. ECS Service
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1
  launch_type     = "EC2"
  depends_on      = [var.rds_dependency]
}
