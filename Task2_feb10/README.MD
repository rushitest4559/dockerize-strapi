# Strapi Application – Dockerized Setup (PostgreSQL + Nginx)

This repository contains a fully Dockerized **Strapi v4** application using:
- **PostgreSQL** as the database
- **Nginx** as a reverse proxy
- **Docker Compose** for orchestration

The setup is suitable for **local development** and easily extendable for **production**.

---

## 📂 Project Structure

TASK2_FEB10-docker/
│
├── docker-compose.yml
│
├── nginx/
│   └── nginx.conf
│
└── strapi/
    ├── Dockerfile
    ├── .dockerignore       
    ├── config/
    │   └── server.js


---

## ⚙️ Services

### 1️⃣ Strapi
- Node.js 20 (required for Strapi)
- Strapi v4 created inside the container
- PostgreSQL driver (`pg`) installed explicitly

### 2️⃣ PostgreSQL
- Image: `postgres:15`
- Persistent data using Docker volumes

### 3️⃣ Nginx
- Acts as a reverse proxy
- Routes traffic to Strapi on port `1337`

---

## 🐳 Docker Compose Configuration

### Networks
- Custom bridge network: `strapi-net`

### Volumes
- `postgres-data` for database persistence

---

## 🚀 How to Run the Project

    docker compose down -v
    docker system prune -f
    
    docker compose build --no-cache
    docker compose up
