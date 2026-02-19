####################################
# 1. ECS Security Group (Strapi)
####################################
resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-ecs-sg"
  description = "Security group for Strapi ECS Fargate"
  vpc_id      = var.vpc_id

  tags = { Name = "${var.project_name}-ecs-sg" }
}

# Allow Strapi Port 1337 from Internet
resource "aws_vpc_security_group_ingress_rule" "strapi_ingress" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 1337
  to_port           = 1337
  ip_protocol       = "tcp"
}

# Allow All Outbound (Required for ECR and RDS communication)
resource "aws_vpc_security_group_egress_rule" "ecs_all_outbound" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

####################################
# 2. RDS Security Group (Postgres)
####################################
resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for RDS Postgres"
  vpc_id      = var.vpc_id

  tags = { Name = "${var.project_name}-rds-sg" }
}

# Allow Postgres Port 5432 ONLY from ECS Security Group
resource "aws_vpc_security_group_ingress_rule" "rds_ingress" {
  security_group_id            = aws_security_group.rds_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "rds_ingress_v2" {
  security_group_id = aws_security_group.rds_sg.id
  cidr_ipv4         = "172.31.0.0/16" # Your VPC CIDR from the screenshot
  from_port         = 5432
  to_port           = 5432
  ip_protocol       = "tcp"
}