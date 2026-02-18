variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "rushikesh-strapi"
}

variable "ecr_image_url" {
  default = "019138829474.dkr.ecr.us-east-1.amazonaws.com/rushikesh-strapii:latest"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  default     = "strapi_secure_password"
}