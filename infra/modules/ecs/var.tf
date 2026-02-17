variable "project_name" {
  type    = string
  default = "rushikesh-strapi"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ecs_sg_id" {
  type = string
}

variable "ecr_image_url" {
  description = "Full ECR Image URI"
  type        = string
}