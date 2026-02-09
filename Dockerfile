# ---------- STAGE 1: BUILD ----------
FROM node:20-slim AS build

ENV CI=true
ENV STRAPI_TELEMETRY_DISABLED=true
ENV NODE_ENV=development

RUN apt-get update && apt-get install -y \
    build-essential python3 make g++ libvips-dev git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Create project (NON-interactive + NO quickstart)
RUN npx create-strapi-app@latest app \
    --no-run \
    --skip-cloud \
    --dbclient=sqlite \
    --dbfile=.tmp/data.db \
    --typescript=false \
    --install

WORKDIR /opt/app

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
