module "security_group" {
  source       = "../modules/security-group"
  vpc_id       = "vpc-00dc8e01b3aa79cf2" # Default VPC ID from console
  project_name = var.project_name
}

module "rds" {
  source             = "../modules/rds"
  project_name       = var.project_name
  single_az          = "us-east-1b"
  private_subnet_ids = ["subnet-03c103d71f50f4961", "subnet-0c0286138c0ed85dc"] # Default private subnets
  rds_sg_id          = module.security_group.rds_sg_id
  db_password        = var.db_password
}

module "ecs" {
  source = "../modules/ecs"

  project_name      = var.project_name
  public_subnet_id  = "subnet-03c103d71f50f4961"      # Default public subnet
  ecs_fargate_sg_id = module.security_group.ecs_sg_id # Updated name
  ecr_image_url     = var.ecr_image_url

  # RDS Connection Details
  db_host        = module.rds.db_endpoint
  db_name        = module.rds.db_name
  db_username    = "strapi"
  db_password    = var.db_password
  rds_dependency = module.rds.db_id # Use db_id instead of full module

  # FARGATE REQUIRED variables
  ecs_execution_role_arn = "arn:aws:iam::019138829474:role/ecsTaskExecutionRole"
}
