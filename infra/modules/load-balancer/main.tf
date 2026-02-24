# --- Application Load Balancer ---
resource "aws_lb" "strapi" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids

  tags = { Name = "${var.project_name}-alb" }
}

# --- Target Group: BLUE (Production) ---
resource "aws_lb_target_group" "blue" {
  name        = "${var.project_name}-tg-blue"
  port        = 1337
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip" # Required for Fargate

  health_check {
    path                = "/_health" # Standard Strapi health check path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# --- Target Group: GREEN (Replacement) ---
resource "aws_lb_target_group" "green" {
  name        = "${var.project_name}-tg-green"
  port        = 1337
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/_health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# --- Production Listener (Port 80/443) ---
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.strapi.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }

  # IMPORTANT: Prevent Terraform from resetting traffic during a CodeDeploy shift
  lifecycle {
    ignore_changes = [default_action]
  }
}

# --- Test Listener (Port 8080) - Optional for Green Validation ---
resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.strapi.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.green.arn
  }

  lifecycle {
    ignore_changes = [default_action]
  }
}