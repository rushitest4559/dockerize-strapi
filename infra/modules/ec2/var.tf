variable "name" {
  description = "Prefix for the instance name"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "subnet_id" {
  description = "The ID of the PRIVATE subnet to launch in"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the instance security group"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "user_data" {
  description = "The script to run on instance start"
  type        = string
  default     = null
}

variable "public_subnet_id" {
  description = "The ID of the public subnet for the bastion host"
  type        = string
}