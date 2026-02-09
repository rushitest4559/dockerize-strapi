# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Needed for sharp/sqlite builds
RUN apk add --no-cache python3 make g++

# Create Strapi project (non-interactive)
RUN echo "n" | STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest strapi-app --quickstart --no-run --skip-cloud

WORKDIR /app/strapi-app

# Build admin panel
RUN npm run build


# ---------- Stage 2: Runtime ----------
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# copy built app
COPY --from=builder /app/strapi-app ./

# install only prod deps
RUN npm install --omit=dev

EXPOSE 1337

CMD ["npm", "run", "start"]
