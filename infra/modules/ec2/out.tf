output "instance_id" {
  description = "The ID of the EC2 instance (Used by ALB attachment)"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "bashion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "instance_arn" {
  description = "The ARN of the instance"
  value       = aws_instance.this.arn
}