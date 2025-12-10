variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "docker_image" {
  description = "Docker Hub image"
  type        = string
}

variable "strapi_port" {
  type    = number
  default = 1337
}

variable "key_name" {
  description = "EC2 key pair name for SSH (set null to disable)"
  type        = string
  default     = null
}


variable "allowed_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
