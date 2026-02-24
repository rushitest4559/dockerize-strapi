variable "region" { 
  type    = string 
  default = "us-east-1"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1e", "us-east-1f"] 
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["172.31.128.0/24", "172.31.129.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["172.31.130.0/24", "172.31.131.0/24"]
}

variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}