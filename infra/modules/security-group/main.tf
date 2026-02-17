resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-ecs-sg"
  description = "Allow Strapi and Postgres traffic"
  vpc_id      = var.vpc_id

  # Inbound: Allow Strapi (Port 1337) from anywhere
  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound: Allow Postgres (Port 5432) 
  # We restrict this to ONLY traffic coming from within this same Security Group
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    self            = true 
  }

  # Outbound: Allow all traffic (Required for ECR image pull and updates)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ecs-sg"
  }
}