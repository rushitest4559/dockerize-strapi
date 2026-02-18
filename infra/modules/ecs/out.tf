output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  value = aws_ecs_service.main.name
}

output "strapi_access_info" {
  value = <<EOF
  FARGATE TASKS - DYNAMIC IPs
  1. ECS Console → Clusters → ${aws_ecs_cluster.main.name}
  2. Services → ${aws_ecs_service.main.name} 
  3. Tasks → Click task → Network → Public IP
  4. Visit: http://[PUBLIC-IP]:1337/admin
  
  URL changes on task restart!
  EOF
}
