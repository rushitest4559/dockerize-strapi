
# --- Get default vpc and igw id ---
data "aws_vpc" "default" {
  default = true
}
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "security_group" {
  source       = "../modules/security-group"
  vpc_id       = data.aws_vpc.default.id
  project_name = var.project_name
}

module "networking" {
  source = "../modules/networking"
  vpc_id = data.aws_vpc.default.id
  igw_id = data.aws_internet_gateway.default.id
}

module "load-balancer" {
  source = "../modules/load-balancer"
  public_subnet_ids = module.networking.public_subnet_ids
  vpc_id = data.aws_vpc.default.id
  alb_sg_id = module.security_group.lb_sg_id
  project_name = var.project_name
}

module "rds" {
  source             = "../modules/rds"
  project_name       = var.project_name
  private_subnet_ids = module.networking.private_subnet_ids
  rds_sg_id          = module.security_group.rds_sg_id
  db_password        = var.db_password
}

module "ecs" {
  source = "../modules/ecs"
  project_name = var.project_name
  ecs_execution_role_arn = var.ecs_execution_role_arn
  strapi_env_vars = var.strapi_env_vars
  ecr_image_url = "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/rushikesh-strapi:latest"
  private_subnet_ids = module.networking.private_subnet_ids
  ecs_fargate_sg_id = module.security_group.ecs_sg_id
  blue_tg_arn = module.load-balancer.blue_tg_arn
}
