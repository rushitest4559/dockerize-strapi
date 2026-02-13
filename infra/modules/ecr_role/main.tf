# IAM Role
resource "aws_iam_role" "ecr_role" {
  name = "${var.name}-ecr-role"

  # Trust policy allows EC2 service to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Policy Attachment (ReadOnly access to ECR)
resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.ecr_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Instance Profile (This is what you actually pass to the EC2 module)
resource "aws_iam_instance_profile" "ecr_profile" {
  name = "${var.name}-ecr-profile"
  role = aws_iam_role.ecr_role.name
}