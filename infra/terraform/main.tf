# 1. Fetch Latest AMI
module "ami" {
  source = "../modules/ami"
}

# 2. Network (VPC, 2 Public Subnets, 1 Private, NAT GW)
module "networking" {
  source               = "../modules/networking"
  name                 = var.name
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  az_1                 = var.az_1
  az_2                 = var.az_2
}

# 3. IAM Role & Instance Profile for ECR Access
# This module creates the role and the profile needed for ECR login
# module "iam" {
#   source = "../modules/ecr_role"
#   name   = var.name
# }

# 4. Security Groups (ALB and Instance)
module "security_group" {
  source   = "../modules/security-group"
  name     = var.name
  vpc_id   = module.networking.vpc_id
  ssh_cidr = var.ssh_cidr
}

# 5. SSH Key Pair
module "keypair" {
  source   = "../modules/keypair"
  key_name = var.key_name
  ssh_dir  = var.ssh_dir
}

# 6. Private EC2 Instance
# Now includes iam_instance_profile to allow 'aws ecr get-login-password' to work
module "ec2" {
  source            = "../modules/ec2"
  name              = var.name
  ami_id            = module.ami.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.networking.private_subnet_id
  public_subnet_id  = module.networking.public_subnet_ids[0]
  security_group_id = module.security_group.instance_sg_id
  key_name          = module.keypair.key_name
  user_data = templatefile("${path.module}/user_data.sh", {
    image_tag = var.image_tag
  })
  # iam_instance_profile = module.iam.instance_profile_name
}

# 7. Application Load Balancer
module "lb" {
  source              = "../modules/load-balancer"
  name                = var.name
  vpc_id              = module.networking.vpc_id
  public_subnet_ids   = module.networking.public_subnet_ids
  private_instance_id = module.ec2.instance_id
  security_groups     = [module.security_group.alb_sg_id]
}
