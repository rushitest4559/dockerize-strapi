resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id # Should be the private subnet ID
  key_name      = var.key_name

  # iam_instance_profile = var.iam_instance_profile

  # Changed to false for private subnet security
  associate_public_ip_address = false 

  # Use a list for security groups
  vpc_security_group_ids = [var.security_group_id]

  user_data = templatefile("user_data.sh", {
    image_tag = var.image_tag
  })
  user_data_replace_on_change = true

  # Best practice: Add metadata options to require IMDSv2
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "${var.name}-ec2"
  }
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = "t2.micro" # Bastion doesn't need much power
  subnet_id                   = var.public_subnet_id # Must be a Public Subnet
  key_name                    = var.key_name
  associate_public_ip_address = true # Required for you to connect from home

  # We use the same SG list as you requested, but ensure it allows SSH (22)
  vpc_security_group_ids = [var.security_group_id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "${var.name}-bastion"
  }
}