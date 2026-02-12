output "website_url" {
  description = "Access your Strapi app here"
  value       = "http://${module.lb.alb_dns_name}"
}

output "nat_gateway_ip" {
  value = module.networking.nat_gw_public_ip
}

output "strapi_instance_private_ip" {
  value = module.ec2.private_ip
}

output "bashion_public_ip" {
  value = module.ec2.bashion_public_ip
}