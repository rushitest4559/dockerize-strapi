#!/bin/bash

LOG_FILE="/home/ubuntu/user_data_logs.txt"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "--- Script started at $(date) ---"

# Wait for network connectivity
echo "Waiting for network..."
while ! ping -c1 8.8.8.8 >/dev/null 2>&1; do
    echo "Network not ready, waiting..."
    sleep 5
done
echo "Network ready!"

# Disable IPv6 to avoid timeouts
echo "Disabling IPv6..."
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Increase apt timeouts
echo "Configuring apt timeouts..."
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::http::Timeout "120";' > /etc/apt/apt.conf.d/99timeout
echo 'Acquire::ftp::Timeout "120";' >> /etc/apt/apt.conf.d/99timeout

# Add official Docker repository (more reliable than Ubuntu's docker.io)
echo "Adding official Docker repository..."
apt-get update -y || echo "WARN: First apt update failed, retrying after 10s..." && sleep 10 && apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release || { echo "FAILED: Essential packages install failed"; exit 1; }

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg || { echo "FAILED: Docker GPG key failed"; exit 1; }

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y || { echo "FAILED: Docker repo update failed"; exit 1; }

# Install Docker from official repo
echo "Installing Docker from official repository..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { echo "FAILED: Docker install failed"; exit 1; }

# Verify installations
if command -v docker >/dev/null 2>&1; then
    echo "SUCCESS: Docker installed - $(docker --version)"
else
    echo "ERROR: Docker installation failed"
    exit 1
fi

if docker compose version >/dev/null 2>&1; then
    echo "SUCCESS: Docker Compose installed - $(docker-compose --version)"
else
    echo "ERROR: Docker Compose installation failed"
    exit 1
fi

# Start and enable Docker
echo "Starting Docker service..."
systemctl start docker || { echo "FAILED: systemctl start docker failed"; exit 1; }
systemctl enable docker || echo "WARN: systemctl enable docker failed"
usermod -aG docker ubuntu || echo "WARN: usermod failed (group may not exist yet)"

# Setup project
echo "Setting up directories..."
mkdir -p /home/ubuntu/strapi/nginx
cd /home/ubuntu/strapi || { echo "FAILED: cd failed"; exit 1; }

echo "Creating Nginx config..."
cat <<'EOT' > nginx/default.conf
server {
    listen 80;
    location / {
        proxy_pass http://strapi-app:1337;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOT

echo "Creating docker-compose.yml..."
cat <<'EOT' > docker-compose.yml
version: "3.8"
services:
  strapi-db:
    image: postgres:15-alpine
    container_name: strapi-db
    restart: unless-stopped
    environment:
      POSTGRES_USER: strapi_user
      POSTGRES_PASSWORD: strapi_password
      POSTGRES_DB: strapi_db
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - strapi-net

  strapi-app:
    image: rushin4559/strapi:latest
    container_name: strapi-app
    restart: unless-stopped
    environment:
      DATABASE_CLIENT: postgres
      DATABASE_HOST: strapi-db
      DATABASE_PORT: 5432
      DATABASE_NAME: strapi_db
      DATABASE_USERNAME: strapi_user
      DATABASE_PASSWORD: strapi_password
      NODE_ENV: production
      APP_KEYS: testKey1,testKey2
      API_TOKEN_SALT: testSalt
      ADMIN_JWT_SECRET: testSecret
      TRANSFER_TOKEN_SALT: testTransfer
      JWT_SECRET: anotherTestSecret
    depends_on:
      - strapi-db
    networks:
      - strapi-net

  strapi-proxy:
    image: nginx:alpine
    container_name: strapi-proxy
    restart: unless-stopped
    ports:
      - "80:80"
    volumes:
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - strapi-app
    networks:
      - strapi-net

networks:
  strapi-net:
    name: strapi-net
    driver: bridge

volumes:
  postgres_data:
EOT

echo "Setting permissions..."
chown -R ubuntu:ubuntu /home/ubuntu/strapi
chown ubuntu:ubuntu "$LOG_FILE"

echo "Launching containers..."
docker compose up -d || { echo "FAILED: docker-compose up failed"; exit 1; }

echo "SUCCESS: All containers launched - $(docker ps --format 'table {{.Names}}')"
echo "--- Script finished successfully at $(date) ---"
