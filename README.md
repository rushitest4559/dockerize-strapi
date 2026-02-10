# Strapi Docker Optimization
![img1](./screenshots/img1.PNG)
![img2](./screenshots/img2.PNG)
![img3](./screenshots/img3.PNG)
![img4](./screenshots/img4.PNG)
![img5](./screenshots/img5.PNG)

```bash
docker network create strapi-net && docker volume create postgres_data
```
```bash
docker run -d --name strapi-db --network strapi-net -v postgres_data:/var/lib/postgresql/data -e POSTGRES_USER=strapi_user -e POSTGRES_PASSWORD=strapi_password -e POSTGRES_DB=strapi_db postgres:15-alpine
```
```bash
docker build -t strapi-app-image . 
```
```bash
docker run -d --name strapi-app --network strapi-net -e DATABASE_CLIENT=postgres -e DATABASE_HOST=strapi-db -e DATABASE_PORT=5432 -e DATABASE_NAME=strapi_db -e DATABASE_USERNAME=strapi_user -e DATABASE_PASSWORD=strapi_password -e NODE_ENV=production -e APP_KEYS="testKey1,testKey2" -e API_TOKEN_SALT="testSalt" -e ADMIN_JWT_SECRET="testSecret" -e TRANSFER_TOKEN_SALT="testTransfer" -e JWT_SECRET="anotherTestSecret" strapi-app-image
```
```bash
docker run -d --name strapi-proxy --network strapi-net -p 80:80 -v %cd%\nginx\default.conf:/etc/nginx/conf.d/default.conf:ro nginx:alpine
```