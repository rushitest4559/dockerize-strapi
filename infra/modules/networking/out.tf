output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
output "private_rt_id" { value = aws_route_table.private.id }