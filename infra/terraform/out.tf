output "vpc_id" {
  value = module.networking.vpc_id
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

# Instruction for the user to find the IP
output "how_to_access_strapi" {
  value = "Wait 2 minutes for the container to start, then run this command to get your Public IP:"
}

output "get_public_ip_command" {
  value = "aws ecs list-tasks --cluster ${module.ecs.cluster_name} --service-name ${module.ecs.service_name} --query 'taskArns[0]' --output text | xargs aws ecs describe-tasks --cluster ${module.ecs.cluster_name} --tasks | grep -i publicIp"
}