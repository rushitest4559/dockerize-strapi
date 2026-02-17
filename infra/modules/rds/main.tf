# 1. RDS Subnet Group (Required for RDS in a VPC)
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# 2. RDS Instance
resource "aws_db_instance" "strapi_db" {
  identifier           = "${var.project_name}-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15" # Latest stable version for Strapi
  instance_class       = "db.t3.micro"

  multi_az             = false
  
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]
  
  # Security Settings
  publicly_accessible = false
  skip_final_snapshot = true # Useful for testing; set to false for production
  
  # Backup Settings
  backup_retention_period = 7
  deletion_protection     = false

  tags = {
    Name = "${var.project_name}-rds"
  }
}