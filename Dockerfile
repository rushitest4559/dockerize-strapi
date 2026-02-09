# ---------- Stage 1: Build ----------
FROM node:20-alpine AS build

# Install build dependencies for native modules (sharp, sqlite3)
RUN apk add --no-cache build-base gcc autoconf automake libtool vips-dev zlib-dev python3

WORKDIR /opt/app

# Copy package files first to leverage Docker cache
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Copy the rest of the source code
COPY . .

# Build the Strapi admin panel
RUN npm run build

# ---------- Stage 2: Runtime ----------
FROM node:20-alpine

# Install only the runtime library for sharp
RUN apk add --no-cache vips-dev

WORKDIR /opt/app

# Copy only the necessary files from the build stage
COPY --from=build /opt/app ./

# Set environment to production
ENV NODE_ENV=production

EXPOSE 1337

CMD ["npm", "start"]