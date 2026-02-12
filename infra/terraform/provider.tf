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
  # Remote Backend (Recommended for production)
  # Commented intentionally for assignment/demo
  ############################################
  /*
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "strapi-ec2/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
  */
}

############################################
# AWS Provider
############################################
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Strapi-Terraform-Assignment"
      Environment = "dev"
      ManagedBy   = "Terraform"
      Owner       = "Rushi"
    }
  }
}
