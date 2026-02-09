# ---------- STAGE 1: BUILD ----------
FROM node:20-slim AS build

ENV CI=true
ENV STRAPI_TELEMETRY_DISABLED=true

RUN apt-get update && apt-get install -y \
    build-essential gcc make python3 libvips-dev git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Create Strapi app inside folder (important ⚠️)
RUN npx --yes create-strapi-app@latest app \
    --quickstart --skip-cloud --no-run

WORKDIR /opt/app

# Ensure deps + build
RUN npm install
RUN npm run build

# ---------- STAGE 2: RUNTIME ----------
FROM node:20-slim

RUN apt-get update && apt-get install -y libvips \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY --from=build /opt/app ./

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm","run","start"]
