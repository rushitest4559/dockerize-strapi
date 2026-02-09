# ---------- Stage 1: Build ----------
FROM node:20-alpine AS build
RUN apk add --no-cache build-base gcc autoconf automake libtool vips-dev zlib-dev python3
WORKDIR /opt/app
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile
COPY . .
RUN npm run build
# Prune here to shrink the node_modules before the copy
RUN npm prune --omit=dev && npm cache clean --force

# ---------- Stage 2: Runtime ----------
FROM node:20-alpine
# Runtime dependencies
RUN apk add --no-cache vips
WORKDIR /opt/app

# Copy EVERYTHING from the build stage 
# (It's already pruned, so it's safe and won't fail)
COPY --from=build /opt/app ./

ENV NODE_ENV=production
EXPOSE 1337
# Strapi uses 'npm start' to run the production build
CMD ["npm", "start"]