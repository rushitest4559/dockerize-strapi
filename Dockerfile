# 1. Use Node.js 18 (Debian-based, easier for native builds)
FROM node:18

# 2. Set working directory
WORKDIR /app

# 3. Install build tools required for node-gyp (for sqlite3/sharp etc.)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
 && rm -rf /var/lib/apt/lists/*

# 4. Copy dependency files
COPY package.json package-lock.json* ./

# 5. Install dependencies
RUN npm install

# 6. Copy the rest of the Strapi project
COPY . .

# 7. Build Strapi admin
RUN npm run build

# 8. Expose Strapi default port
EXPOSE 1337

# 9. Start Strapi (dev mode for local)
CMD ["npm", "run", "develop"]

