output "db_endpoint" {
  value       = aws_db_instance.strapi_db.endpoint  # Full endpoint (host:port)
  description = "Full RDS endpoint (host:port)"
}

output "db_address" {
  value       = aws_db_instance.strapi_db.address
  description = "RDS hostname only"
}

output "db_port" {
  value       = aws_db_instance.strapi_db.port
  description = "RDS port (5432)"
}

output "db_name" {
  value       = aws_db_instance.strapi_db.db_name
  description = "Database name"
}

output "db_username" {
  value       = aws_db_instance.strapi_db.username
  description = "Database username"
}

output "db_id" {
  value       = aws_db_instance.strapi_db.id
  description = "RDS instance identifier"
}
