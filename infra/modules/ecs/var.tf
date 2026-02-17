variable "project_name" {}
variable "ecr_image_url" {}
variable "db_host" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "public_subnet_id" {}
variable "ecs_sg_id" {}
variable "key_name" {
  
}
variable "rds_dependency" {
  description = "RDS dependency"
  type        = any
  default     = null
}