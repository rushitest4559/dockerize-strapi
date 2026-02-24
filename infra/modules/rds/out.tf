output "db_endpoint" {
  value       = aws_db_instance.strapi_db.endpoint  # Full endpoint (host:port)
  description = "Full RDS endpoint (host:port)"
}

output "db_address" {
  value       = aws_db_instance.strapi_db.address
  description = "RDS hostname only"
}

