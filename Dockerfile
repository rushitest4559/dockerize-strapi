# ---------- Build Stage ----------
FROM node:20-alpine AS builder

WORKDIR /app

# deps needed only for build (sharp/sqlite)
RUN apk add --no-cache python3 make g++ vips-dev

# create project non-interactively
RUN echo "n" | STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest strapi-app --quickstart --no-run --skip-cloud

WORKDIR /app/strapi-app

ENV NODE_ENV=production

# build admin panel
RUN npm run build

# remove dev dependencies
RUN npm prune --omit=dev


# ---------- Runtime Stage ----------
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# runtime lib for sharp
RUN apk add --no-cache vips

# copy built minimal app
COPY --from=builder /app/strapi-app ./

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
