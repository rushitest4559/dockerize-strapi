output "db_endpoint" {
  value       = aws_db_instance.strapi_db.address
  description = "The hostname of the RDS instance"
}

output "db_port" {
  value = aws_db_instance.strapi_db.port
}

output "db_name" {
  value = aws_db_instance.strapi_db.db_name
}