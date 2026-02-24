variable "project_name" {
  type        = string
  description = "Name of the project used for resource naming"
}

variable "region" {
  type        = string
  description = "AWS region (required for CloudWatch logs)"
  default = "us-east-1"
}

variable "ecr_image_url" {
  type        = string
  description = "Full URL of the Strapi Docker image in ECR"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "IAM role ARN that allows ECS to pull images and send logs"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs where Strapi will run"
}

variable "ecs_fargate_sg_id" {
  type        = string
  description = "Security group ID for the ECS tasks"
}

variable "blue_tg_arn" {
  type        = string
  description = "ARN of the Blue (production) target group"
}

variable "db_vars" {
  type = map(string)
}

variable "db_endpoint" {
  type = string
}