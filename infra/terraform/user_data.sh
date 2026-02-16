#!/bin/bash

LOG_FILE="/home/ubuntu/user_data_logs.txt"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "--- Script started at $(date) ---"

# 1. Wait for network connectivity
echo "Waiting for network..."
while ! ping -c1 8.8.8.8 >/dev/null 2>&1; do
    echo "Network not ready, waiting..."
    sleep 5
done
echo "Network ready!"

# 2. Disable IPv6 & Configure apt timeouts
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::http::Timeout "120";' > /etc/apt/apt.conf.d/99timeout

# 3. Install Docker
echo "Installing Docker..."
apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 4. Start Docker
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

# 5. Setup project directories & files
mkdir -p /home/ubuntu/strapi/nginx
cd /home/ubuntu/strapi

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
    # UPDATED: Pulling from Docker Hub repository
    image: rushin4559/strapi:${image_tag}
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

chown -R ubuntu:ubuntu /home/ubuntu/strapi
chown ubuntu:ubuntu "$LOG_FILE"

# 6. Launch containers (Docker Hub public images don't need login)
echo "Launching containers from Docker Hub..."
docker compose up -d || { echo "FAILED: docker-compose up failed"; exit 1; }

echo "SUCCESS: All containers launched"
echo "--- Script finished successfully at $(date) ---"