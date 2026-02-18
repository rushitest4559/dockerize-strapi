# Subnet group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# RDS instance (minimal + cheap)
resource "aws_db_instance" "strapi_db" {
  identifier        = "${var.project_name}-db"

  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]

  # SINGLE AZ
  multi_az          = false

  # COST OPTIMIZED
  publicly_accessible = true

  # 🚨 NO BACKUPS / SNAPSHOTS
  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false
  delete_automated_backups = true

  # Windows MUST NOT overlap
  backup_window      = "03:00-03:30"
  maintenance_window = "mon:04:00-mon:05:00"

  # Optional but useful
  auto_minor_version_upgrade = true
  apply_immediately          = true

  tags = {
    Name = "${var.project_name}-rds"
  }

  lifecycle {
    prevent_destroy = false
  }
}
