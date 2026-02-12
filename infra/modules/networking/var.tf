variable "name" {
  description = "Common name prefix for all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "az_1" {
  description = "First availability zone (e.g., us-east-1a)"
  type        = string
}

variable "az_2" {
  description = "Second availability zone (e.g., us-east-1b)"
  type        = string
}