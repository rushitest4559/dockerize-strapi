####################################
# 1. Load Balancer Security Group
####################################
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg"
  description = "External traffic to ALB"
  vpc_id      = var.vpc_id
}

# Allow HTTP from anywhere
resource "aws_vpc_security_group_ingress_rule" "alb_http_in" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Allow HTTPS from anywhere
resource "aws_vpc_security_group_ingress_rule" "alb_https_in" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# Outbound: Allow ALB to talk to ECS tasks
resource "aws_vpc_security_group_egress_rule" "alb_egress_to_ecs" {
  security_group_id            = aws_security_group.alb_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  ip_protocol                  = "-1"
}

####################################
# 2. ECS Security Group (Strapi App)
####################################
resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-ecs-sg"
  description = "Security group for Strapi ECS Fargate"
  vpc_id      = var.vpc_id
}

# Allow Strapi Port 1337 ONLY from the Load Balancer
resource "aws_vpc_security_group_ingress_rule" "strapi_ingress_from_alb" {
  security_group_id            = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 1337
  to_port                      = 1337
  ip_protocol                  = "tcp"
}

# Allow All Outbound (Required for ECR, RDS, and CloudWatch via Endpoints)
resource "aws_vpc_security_group_egress_rule" "ecs_all_outbound" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

####################################
# 3. RDS Security Group (Postgres)
####################################
resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for RDS Postgres"
  vpc_id      = var.vpc_id
}

# Allow Postgres Port 5432 ONLY from ECS Security Group
resource "aws_vpc_security_group_ingress_rule" "rds_ingress_from_ecs" {
  security_group_id            = aws_security_group.rds_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

####################################
# 4. VPC Endpoint Security Group
####################################
resource "aws_security_group" "vpce_sg" {
  name        = "${var.project_name}-vpce-sg"
  description = "Security group for VPC Endpoints (ECR/S3/Logs/ECS)"
  vpc_id      = var.vpc_id
}

# Allow HTTPS (443) from ECS Tasks to access AWS Services
resource "aws_vpc_security_group_ingress_rule" "vpce_ingress_from_ecs" {
  security_group_id            = aws_security_group.vpce_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}
