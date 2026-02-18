# 1. RDS Subnet Group (unchanged)
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# 2. RDS Instance - SINGLE AZ + NO SNAPSHOTS
resource "aws_db_instance" "strapi_db" {
  identifier           = "${var.project_name}-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"

  # SINGLE AZ ENFORCED
  multi_az             = false
  availability_zone    = var.single_az  # Pass specific AZ
  
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]
  
  # NO SNAPSHOTS - COMPLETE CLEANUP
  backup_retention_period = 0      # No automated backups
  skip_final_snapshot    = true    # No final snapshot on destroy
  deletion_protection    = false   # Allows terraform destroy
  
  # Disable all backup features
  backup_window              = "00:00-00:30"  # Irrelevant with retention=0
  maintenance_window         = "mon:00:00-mon:03:00"
  copy_tags_to_snapshot      = false
  delete_automated_backups   = true
  
  publicly_accessible = false

  tags = {
    Name = "${var.project_name}-rds"
  }

  # LIFECYCLE - Ensures clean destroy
  lifecycle {
    prevent_destroy = false
    ignore_changes  = []
  }
}
