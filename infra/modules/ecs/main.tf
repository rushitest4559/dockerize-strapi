# 0. - CloudWatch Log Group 
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.project_name}-cluster/${var.project_name}-service"
  retention_in_days = 7

  tags = {
    Name = "${var.project_name}-ecs-logs"
  }
}

# 1. ECS Cluster with BOTH Capacity Providers
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}


# 2. Task Definition (unchanged)
resource "aws_ecs_task_definition" "strapi" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = var.ecs_execution_role_arn

  container_definitions = jsonencode([
    {
      name         = "strapi-container"
      image        = var.ecr_image_url
      essential    = true
      portMappings = [{ containerPort = 1337 }]
      environment = [
        { name = "DATABASE_SSL", value = "true" },
        { name = "DATABASE_SSL_REJECT_UNAUTHORIZED", value = "false" },
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

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

# 3. ECS Service - 50/50 Fargate + Spot
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1

  # Strategy: 50% Fargate + 50% Spot
  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  network_configuration {
    subnets          = [var.public_subnet_id]
    security_groups  = [var.ecs_fargate_sg_id]
    assign_public_ip = true
  }

  depends_on = [var.rds_dependency]
}
