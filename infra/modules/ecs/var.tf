variable "project_name" {}
variable "ecr_image_url" {}
variable "db_host" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "public_subnet_id" {}
variable "rds_dependency" {
  description = "RDS dependency"
  type        = any
  default     = null
}

# NEW FARGATE VARIABLES (remove old EC2 ones)
variable "ecs_fargate_sg_id" {}           # ← Changed from ecs_sg_id
variable "ecs_execution_role_arn" {}     # ← NEW (required for ECR pull)
variable "ecs_task_role_arn" {}          # ← NEW (optional for app)
