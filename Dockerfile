# ---------- Stage 1: Build ----------
FROM node:20-alpine AS build
RUN apk add --no-cache build-base gcc autoconf automake libtool vips-dev zlib-dev python3
WORKDIR /opt/app
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile
COPY . .
RUN npm run build
# NEW: Remove development dependencies and clean cache
RUN npm prune --omit=dev && npm cache clean --force

# ---------- Stage 2: Runtime ----------
FROM node:20-alpine
# Use vips (runtime) instead of vips-dev (header files) if possible
RUN apk add --no-cache vips 
WORKDIR /opt/app

# COPY ONLY WHAT IS NEEDED
COPY --from=build /opt/app/node_modules ./node_modules
COPY --from=build /opt/app/dist ./dist
COPY --from=build /opt/app/package.json ./package.json
COPY --from=build /opt/app/public ./public

ENV NODE_ENV=production
EXPOSE 1337
CMD ["npm", "start"]