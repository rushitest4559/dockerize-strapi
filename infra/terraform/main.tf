
module "networking" {
  source = "../modules/networking"
}

module "security_group" {
  source = "../modules/security-group"
  vpc_id = module.networking.vpc_id
}

module "ecs" {
  source            = "../modules/ecs"
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  ecs_sg_id         = module.security_group.security_group_id
  ecr_image_url     = "811738710312.dkr.ecr.us-east-1.amazonaws.com/rushikesh-strapi:latest"
}