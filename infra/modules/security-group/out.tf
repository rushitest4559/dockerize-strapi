output "ecs_sg_id" {
  value       = aws_security_group.ecs_sg.id
  description = "ID of the Strapi ECS security group"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "ID of the RDS security group"
}