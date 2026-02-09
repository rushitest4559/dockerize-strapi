# ---------- BUILD ----------
FROM node:20-slim AS build

ENV CI=true
ENV STRAPI_TELEMETRY_DISABLED=true

RUN apt-get update && apt-get install -y \
    build-essential python3 make g++ libvips-dev git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# 👇 simulate answering CLI prompts ("n")
RUN printf "n\n" | npx --yes create-strapi-app@latest app \
    --quickstart \
    --no-run \
    --skip-cloud

WORKDIR /opt/app
RUN npm install
RUN npm run build

# ---------- RUNTIME ----------
FROM node:20-slim

RUN apt-get update && apt-get install -y libvips \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app
COPY --from=build /opt/app ./

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm","run","start"]
# ---------- BUILD ----------
FROM node:20-slim AS build

ENV CI=true
ENV STRAPI_TELEMETRY_DISABLED=true

RUN apt-get update && apt-get install -y \
    build-essential python3 make g++ libvips-dev git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# ✅ keep your non-interactive command exactly
RUN printf "n\n" | npx --yes create-strapi-app@latest app \
    --quickstart \
    --no-run \
    --skip-cloud

WORKDIR /opt/app

# install + build
RUN npm install --omit=dev
RUN npm run build

# remove dev deps + cache
RUN npm prune --omit=dev && npm cache clean --force

# ---------- RUNTIME ----------
FROM node:20-alpine

RUN apk add --no-cache vips

WORKDIR /opt/app

# copy only required runtime files
COPY --from=build /opt/app/package*.json ./
COPY --from=build /opt/app/node_modules ./node_modules
COPY --from=build /opt/app/build ./build
COPY --from=build /opt/app/config ./config
COPY --from=build /opt/app/public ./public
COPY --from=build /opt/app/src ./src
COPY --from=build /opt/app/database ./database

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm","run","start"]
