# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

# build deps for sharp/sqlite
RUN apk add --no-cache python3 make g++ vips-dev

# create project
RUN echo "n" | STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest strapi-app --quickstart --no-run --skip-cloud

WORKDIR /app/strapi-app

ENV NODE_ENV=production

# build admin
RUN npm run build

# remove dev deps
RUN npm prune --omit=dev


# ---------- Stage 2: Runtime ----------
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# runtime lib for sharp
RUN apk add --no-cache vips

# copy only needed files
COPY --from=builder /app/strapi-app ./

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
