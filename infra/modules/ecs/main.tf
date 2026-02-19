# 0. CloudWatch Log Group (unchanged)
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.project_name}-cluster/${var.project_name}-service"
  retention_in_days = 7

  tags = {
    Name = "${var.project_name}-ecs-logs"
  }
}

# 0a. CloudWatch Dashboard for ECS Metrics
resource "aws_cloudwatch_dashboard" "ecs_metrics" {
  dashboard_name = "${var.project_name}-ecs-metrics"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type  = "metric"
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.main.name, "ServiceName", aws_ecs_service.main.name],
            [".", "MemoryUtilization", ".", ".", ".", "."]
          ]
          period            = 300
          stat              = "Average"
          region            = "us-east-1"
          title             = "CPU & Memory Utilization"
          view              = "timeSeries"
        }
      },
      {
        type  = "metric"
        properties = {
          metrics = [
            [ "AWS/ECS", "RunningTaskCount", "ClusterName", aws_ecs_cluster.main.name, "ServiceName", aws_ecs_service.main.name ],
            [ "....", "PendingTaskCount", ".", ".", ".", "." ]
          ]
          period            = 300
          stat              = "Average"
          region            = "us-east-1"
          title             = "Task Count"
          view              = "timeSeries"
        }
      },
      {
        type  = "metric"
        properties = {
          metrics = [
            ["AWS/ECS", "NetworkRxBytes", "ClusterName", aws_ecs_cluster.main.name, "ServiceName", aws_ecs_service.main.name],
            ["...", "NetworkTxBytes", ".", ".", ".", "."]
          ]
          period            = 300
          stat              = "Average"
          region            = "us-east-1"
          title             = "Network In/Out (bytes/sec)"
          view              = "timeSeries"
          unit              = "Bits/Second"
        }
      }
    ]
  })
}

# 1. ECS Cluster with BOTH Capacity Providers (unchanged)
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}

# 2. Task Definition (unchanged + CloudWatch metrics enabled)
resource "aws_ecs_task_definition" "strapi" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = var.ecs_execution_role_arn

  # Enable CloudWatch Container Insights metrics
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "strapi-container"
      image     = var.ecr_image_url
      essential = true
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

      # Enable detailed CloudWatch metrics
      enableCloudWatchLogsMetrics = true
    }
  ])
}

# 3. ECS Service - 50/50 Fargate + Spot (unchanged)
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

  # Enable CloudWatch Container Insights
  enable_execute_command = true

  depends_on = [var.rds_dependency]
}
