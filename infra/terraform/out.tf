output "rds_endpoint" {
  value       = module.rds.db_endpoint
  description = "RDS connection endpoint"
}

output "ecs_cluster_name" {
  value       = module.ecs.cluster_name
  description = "ECS cluster name"
}

output "ecs_service_name" {
  value       = module.ecs.service_name
  description = "ECS service name"
}

output "strapi_access_info" {
  value = <<EOF
Fargate Task - Get Public IP from Console:
1. ECS → Clusters → ${module.ecs.cluster_name}
2. Services → ${module.ecs.service_name}
3. Tasks → Click task → Network → Public IP
4. Visit: http://[PUBLIC-IP]:1337/admin

Note: IP changes on task restart!
EOF
}
