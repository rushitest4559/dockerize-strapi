############################################
# Terraform & Provider Configuration
############################################
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }

  ############################################
  # Remote Backend
  ############################################
  backend "s3" {
    bucket  = "rushikesh-strapi-terraform-tfstate"
    key     = "strapi/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # DynamoDB is omitted as you are working solo
  }
}

############################################
# AWS Provider
############################################
provider "aws" {
  region = var.aws_region

  # default_tags {
  #   tags = {
  #     Project     = "Strapi-Terraform-Assignment"
  #     Environment = "dev"
  #     ManagedBy   = "Terraform"
  #     Owner       = "Rushi"
  #   }
  # }
}