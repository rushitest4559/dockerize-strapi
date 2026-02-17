output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "ec2_public_ip" {
  value = module.ecs.ecs_host_public_ip
}

output "strapi_admin_url" {
  value       = module.ecs.strapi_url
  description = "Click this link to access your Strapi Admin"
}