####################################
# 1. ECS Cluster (Monitoring Enabled)
####################################
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled" # Collects CPU, Mem, and Network metrics automatically
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}

####################################
# 2. Logging (CloudWatch Logs)
####################################
resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/${var.project_name}"
  retention_in_days = 7
}

locals {
  strapi_env_vars = [
    { name = "DATABASE_CLIENT", value = "postgres" },
    { name = "DATABASE_HOST", value = var.db_endpoint },
    { name = "DATABASE_PORT", value = "5432" },
    { name = "DATABASE_NAME", value = var.db_vars["db_name"] },
    { name = "DATABASE_USERNAME", value = var.db_vars["db_username"] },
    { name = "DATABASE_PASSWORD", value = var.db_vars["db_password"] },
    { name = "DATABASE_SSL", value = "true" },
    { name = "DATABASE_SSL_REJECT_UNAUTHORIZED", value = "false" },
    { name = "NODE_ENV", value = "production" },
    { name = "APP_KEYS", value = "testKey1,testKey2" },
    { name = "API_TOKEN_SALT", value = "testSalt" },
    { name = "ADMIN_JWT_SECRET", value = "testSecret" },
    { name = "TRANSFER_TOKEN_SALT", value = "testTransfer" },
    { name = "JWT_SECRET", value = "anotherTestSecret" }
  ]
}

####################################
# 3. Task Definition (With Monitoring)
# We can view task as instance (VM) and containers as application running on it. one task can have multiple containers. Here we have only one container in task definition.
####################################
resource "aws_ecs_task_definition" "strapi" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = var.ecs_execution_role_arn

  container_definitions = jsonencode([
    {
      name         = "strapi-container"
      image        = var.ecr_image_url
      essential    = true
      portMappings = [{ containerPort = 1337 }]
      environment  = local.strapi_env_vars
      
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.strapi.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "strapi"
        }
      }
    }
  ])
}

####################################
# 4. ECS Service
####################################
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 2 # Set to at least 2 to see the 50/50 split in action

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 1 # Ensures at least one "reliable" task is always running
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_fargate_sg_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.blue_tg_arn
    container_name   = "strapi-container"
    container_port   = 1337
  }
}

####################################
# 5. Simple Monitoring Dashboard
####################################
resource "aws_cloudwatch_dashboard" "strapi_main" {
  dashboard_name = "${var.project_name}-metrics"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ServiceName", aws_ecs_service.main.name, "ClusterName", aws_ecs_cluster.main.name]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "Strapi CPU Usage"
        }
      },
      {
        type   = "metric"
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ECS", "MemoryUtilization", "ServiceName", aws_ecs_service.main.name, "ClusterName", aws_ecs_cluster.main.name]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "Strapi Memory Usage"
        }
      }
    ]
  })
}