############################################
# Load Balancer Security Group (Public)
############################################

resource "aws_security_group" "alb" {
  name        = "${var.name}-alb-sg"
  description = "Public facing SG for the Load Balancer"
  vpc_id      = var.vpc_id

  tags = { Name = "${var.name}-alb-sg" }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow public HTTP"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb_out" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # Allows ALB to talk to instances
}

############################################
# Instance Security Group (Private)
############################################

resource "aws_security_group" "instance" {
  name        = "${var.name}-instance-sg"
  description = "Private SG for Strapi EC2 instance"
  vpc_id      = var.vpc_id

  tags = { Name = "${var.name}-instance-sg" }
}

# IMPORTANT: Link Instance SG to ALB SG
resource "aws_vpc_security_group_ingress_rule" "instance_from_alb" {
  security_group_id            = aws_security_group.instance.id
  description                  = "Allow traffic ONLY from ALB"
  referenced_security_group_id = aws_security_group.alb.id # Restricts access
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.instance.id
  description       = "SSH access"
  cidr_ipv4         = var.ssh_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "instance_all" {
  security_group_id = aws_security_group.instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}