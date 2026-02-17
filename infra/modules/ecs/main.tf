# 1. ECS Cluster (No changes here)
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"
}

# 2. Task Definition 
resource "aws_ecs_task_definition" "strapi" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512" 
  memory                   = "1024"
  execution_role_arn       = "arn:aws:iam::811738710312:role/ec2-ecr-role"

  container_definitions = jsonencode([
    {
      name      = "strapi-container"
      image     = var.ecr_image_url
      essential = true
      portMappings = [{ containerPort = 1337, hostPort = 1337 }]
      environment = [
        # Database Connection
        { name = "DATABASE_CLIENT",   value = "postgres" },
        { name = "DATABASE_HOST",     value = "127.0.0.1" },
        { name = "DATABASE_PORT",     value = "5432" },
        { name = "DATABASE_NAME",     value = "strapi" },
        { name = "DATABASE_USERNAME", value = "strapi" },
        { name = "DATABASE_PASSWORD", value = "strapi_password" },
        
        # Strapi Secrets (From your script)
        { name = "NODE_ENV",            value = "production" },
        { name = "APP_KEYS",            value = "testKey1,testKey2" },
        { name = "API_TOKEN_SALT",      value = "testSalt" },
        { name = "ADMIN_JWT_SECRET",    value = "testSecret" },
        { name = "TRANSFER_TOKEN_SALT", value = "testTransfer" },
        { name = "JWT_SECRET",          value = "anotherTestSecret" }
      ]
    },
    {
      name      = "postgres-container"
      image     = "postgres:15-alpine"
      essential = true
      environment = [
        { name = "POSTGRES_DB",       value = "strapi" },
        { name = "POSTGRES_USER",     value = "strapi" },
        { name = "POSTGRES_PASSWORD", value = "strapi_password" }
      ]
    }
  ])
}

# 3. ECS Service (No changes here)
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.public_subnet_ids
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = true
  }
}