variable "name" { type = string }
variable "vpc_id" { type = string }
variable "ssh_cidr" { 
  type    = string
  default = "0.0.0.0/0" # Change this to your specific IP for security
}