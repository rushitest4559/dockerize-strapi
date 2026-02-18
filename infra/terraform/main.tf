module "security_group" {
  source       = "../modules/security-group"
  vpc_id       = "vpc-0a4b1c2d3e5f67890"  # Default VPC ID from console
  project_name = var.project_name
}

module "rds" {
  source             = "../modules/rds"
  project_name       = var.project_name
  private_subnet_ids = ["subnet-04d2a7b04323b73f5", "subnet-08965304a1bc70ce8"]  # Default private subnets
  rds_sg_id          = module.security_group.rds_sg_id
  db_password        = var.db_password
}

module "ecs" {
  source = "../modules/ecs"

  project_name      = var.project_name
  public_subnet_id  = "subnet-0623ab3807e8e0f73"  # Default public subnet
  ecs_fargate_sg_id = module.security_group.ecs_sg_id  # Updated name
  ecr_image_url     = var.ecr_image_url

  # RDS Connection Details
  db_host     = module.rds.db_endpoint
  db_name     = module.rds.db_name
  db_username = "strapi"
  db_password = var.db_password
  rds_dependency = module.rds.db_id  # Use db_id instead of full module

  # FARGATE REQUIRED variables
  ecs_execution_role_arn = "arn:aws:iam::123456789012:role/ecsExecutionRole"  # Create this
  ecs_task_role_arn     = "arn:aws:iam::123456789012:role/ecsTaskRole"       # Create this
}
