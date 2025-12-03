# Strapi Task-1 – Local Setup & Sample Content Type

This repository contains the work completed for **TASK-1**, which includes cloning the Strapi repository, running Strapi locally, exploring the folder structure, creating a sample content type, and documenting the entire setup process. A Loom video walkthrough and Pull Request link are also included as required.

## 1. Clone the Strapi Repository

```bash
git clone https://github.com/strapi/strapi.git
cd strapi
```

## 2. Create a Local Strapi Project

```bash
npx create-strapi@latest my-strapi
cd my-strapi
```

## 3. Install Dependencies

```bash
npm install
```

## 4. Run Strapi Locally

```bash
npm run develop
```

Admin Panel: http://localhost:1337/admin

## 5. Create Admin User

Register your first admin user on first launch.

## 6. Explore Project Folder Structure

- config/
- src/api/
- src/components/
- public/
- .env

## 7. Create a Sample Content Type

**Collection Type:** Blog Post  
Fields:
- title (Text)
- content (Rich Text)
- puslishedat(DateTime)

## 8. Push Project to GitHub

```bash
git init
git add .
git commit -m "Initial Strapi project setup with sample content type"
git remote add origin https://github.com/Judsonk07/My-Strapi.git
git branch -M main
git push -u origin main
```

## 9. Loom Video

Add your Loom link here.

## 10. Pull Request

Add your PR link here.

## 11. How to Run This Project

```bash
git clone https://github.com/Judsonk07/My-Strapi.git
cd My-Strapi
npm install
npm run develop
```

Open http://localhost:1337/admin
