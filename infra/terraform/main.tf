module "security_group" {
  source       = "../modules/security-group"
  vpc_id       = "vpc-0b5c422c6de590c86" # Default VPC ID from console
  project_name = var.project_name
}

module "rds" {
  source             = "../modules/rds"
  project_name       = var.project_name
  single_az          = "us-east-1b"
  private_subnet_ids = ["subnet-0402e41a2030320e1", "subnet-023e7b0a4fff131df"] # Default private subnets
  rds_sg_id          = module.security_group.rds_sg_id
  db_password        = var.db_password
}

module "ecs" {
  source = "../modules/ecs"

  project_name      = var.project_name
  public_subnet_id  = "subnet-0402e41a2030320e1"      # Default public subnet
  ecs_fargate_sg_id = module.security_group.ecs_sg_id # Updated name
  ecr_image_url     = var.ecr_image_url

  # RDS Connection Details
  db_host        = module.rds.db_address
  db_name        = module.rds.db_name
  db_username    = "strapi"
  db_password    = var.db_password
  rds_dependency = module.rds.db_id # Use db_id instead of full module

  # FARGATE REQUIRED variables
  ecs_execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
}
