output "ecs_sg_id" {
  value       = aws_security_group.ecs_sg.id
  description = "ID of the Strapi ECS security group"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "ID of the RDS security group"
}

output "lb_sg_id" {
  value = aws_security_group.alb_sg.id
  description = "ID of the ALB security group"
}

output "vpce_sg_id" {
  value = aws_security_group.vpce_sg.id
  description = "ID of the VPC endpoints security group"
}