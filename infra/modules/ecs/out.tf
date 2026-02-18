output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  value = aws_ecs_service.main.name
}

# REMOVED: ecs_host_public_ip (no EC2)
# NEW: Get from ECS service tasks (dynamic)
output "service_arn" {
  value = aws_ecs_service.main.id
}

locals {
  # Helper to get task public IP (use in calling module)
  task_public_ip_data = data.aws_ecs_task_definition.strapi.arn
}

# Note: Fargate tasks get dynamic IPs - use ALB for stable URL
output "strapi_info" {
  value = "Check ECS Console: ${aws_ecs_service.main.id}"
}
