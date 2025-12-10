locals {
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common

              # Install Docker
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) \
                stable"
              apt-get update -y
              apt-get install -y docker-ce docker-compose-plugin

              systemctl enable docker
              systemctl start docker

              # Create app folder
              mkdir -p /srv/strapi
              cd /srv/strapi

              # Pre-pull images
              docker pull postgres:15
              docker pull ${var.docker_image}

              # Write docker-compose
              cat << 'EOC' > docker-compose.yml
              version: "3.8"

              services:
                postgres:
                  image: postgres:15
                  container_name: strapi-postgres
                  restart: unless-stopped
                  environment:
                    POSTGRES_DB: strapi
                    POSTGRES_USER: strapi
                    POSTGRES_PASSWORD: strapi123
                  volumes:
                    - postgres_data:/var/lib/postgresql/data

                strapi:
                  image: ${var.docker_image}
                  container_name: strapi-app
                  restart: unless-stopped
                  depends_on:
                    - postgres
                  ports:
                    - "1337:1337"
                  environment:
                    DATABASE_CLIENT: postgres
                    DATABASE_HOST: strapi-postgres
                    DATABASE_PORT: 5432
                    DATABASE_NAME: strapi
                    DATABASE_USERNAME: strapi
                    DATABASE_PASSWORD: strapi123
                    NODE_ENV: production

              volumes:
                postgres_data:
              EOC

              # Start services
              docker compose up -d
              EOF
}

resource "aws_instance" "strapi" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.strapi_sg.id]
  key_name = var.key_name == null ? null : var.key_name
    associate_public_ip_address = true

  user_data = local.user_data

  tags = {
    Name = "strapi-ubuntu-ec2"
  }
}
