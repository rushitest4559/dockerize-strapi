variable "vpc_id" {
  description = "The ID of the VPC where the SG will be created"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "strapi-project"
}