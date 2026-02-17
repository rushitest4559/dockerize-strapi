variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "rushikesh-strapi"
}

variable "ecr_image_url" {
  description = "The ECR image to deploy"
  default     = "811738710312.dkr.ecr.us-east-1.amazonaws.com/rushikesh-strapi:latest"
}