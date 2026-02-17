variable "project_name" {
  type = string
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the RDS subnet group"
}

variable "rds_sg_id" {
  type        = string
  description = "The Security Group ID for the RDS instance"
}

variable "db_name" {
  type    = string
  default = "strapi"
}

variable "db_username" {
  type    = string
  default = "strapi"
}

variable "db_password" {
  type      = string
  sensitive = true # Hides the password in console logs
}