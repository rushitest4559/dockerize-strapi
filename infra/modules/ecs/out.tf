output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  value = aws_ecs_service.main.name
}

output "ecs_host_public_ip" {
  value = aws_instance.ecs_host.public_ip
}

output "strapi_url" {
  value = "http://${aws_instance.ecs_host.public_ip}:1337/admin"
}