# module "networking" {
#   source       = "../modules/networking"
#   project_name = var.project_name
# }

module "security_group" {
  source = "../modules/security-group"
  # vpc_id       = module.networking.vpc_id
  vpc_id       = "vpc-01f07742b1072b8ab"
  project_name = var.project_name
}

module "rds" {
  source       = "../modules/rds"
  project_name = var.project_name
  # private_subnet_ids = module.networking.private_subnet_ids
  private_subnet_ids = ["subnet-04d2a7b04323b73f5", "subnet-08965304a1bc70ce8"]
  rds_sg_id          = module.security_group.rds_sg_id
  db_password        = var.db_password
}

module "key-pair" {
  source       = "../modules/key-pair"
  project_name = var.project_name
}

module "ecs" {
  source       = "../modules/ecs"
  project_name = var.project_name
  key_name     = module.key-pair.key_name
  # Pass the first public subnet ID for the EC2 host
  # public_subnet_id = module.networking.public_subnet_ids[0]
  public_subnet_id = "subnet-0623ab3807e8e0f73"
  ecs_sg_id        = module.security_group.ecs_sg_id
  ecr_image_url    = var.ecr_image_url

  # RDS Connection Details
  db_host        = module.rds.db_endpoint
  db_name        = module.rds.db_name
  db_username    = "strapi"
  db_password    = var.db_password
  rds_dependency = module.rds
}
