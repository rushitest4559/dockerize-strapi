variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the ALB and Target Group will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of at least TWO public subnet IDs in different AZs"
  type        = list(string)
}

variable "private_instance_id" {
  description = "The ID of the instance in the private subnet to attach to the ALB"
  type        = string
}

variable "security_groups" {
  
}