# STAGE 1: Build
FROM node:20-slim AS build

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    make \
    python3 \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/
RUN STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest app \
    --quickstart \
    --no-run \
    --skip-cloud

WORKDIR /opt/app
RUN npm run build

# STAGE 2: Runtime
FROM node:20-slim

RUN apt-get update && apt-get install -y \
    libvips \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

# Copy production files only
COPY --from=build /opt/app ./

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm", "run", "start"]