

# --- Subnets ---
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags                    = { Name = "strapi-public-${count.index}" }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags              = { Name = "strapi-private-${count.index}" }
}

# --- Route Tables ---
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.default.id
  }
  tags = { Name = "strapi-rt-public" }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  # No 0.0.0.0/0 route here (No NAT)
  tags = { Name = "strapi-rt-private" }
}

# --- Associations ---
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Interface Endpoints for ECR, ECS, Logs, and CloudWatch Monitoring
resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each            = toset(["ecr.api", "ecr.dkr", "logs", "ecs", "monitoring"])
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
}

# Gateway Endpoint for S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id]
}