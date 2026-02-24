output "alb_dns_name" { value = aws_lb.strapi.dns_name }
output "alb_arn" { value = aws_lb.strapi.arn }
output "blue_tg_arn" { value = aws_lb_target_group.blue.arn }
output "green_tg_arn" { value = aws_lb_target_group.green.arn }
output "http_listener_arn" { value = aws_lb_listener.http.arn }
output "test_listener_arn" { value = aws_lb_listener.test.arn }