resource "tls_private_key" "this" {
  algorithm = "ED25519"
}

resource "local_file" "pem" {
  filename        = "${var.ssh_dir}\\${var.key_name}.pem"
  content         = tls_private_key.this.private_key_openssh
  file_permission = "0600"
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh

  tags = {
    Name = var.key_name
  }
}
