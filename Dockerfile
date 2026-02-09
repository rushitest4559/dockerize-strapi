# STAGE 1: Build
FROM node:20-slim AS build

RUN apt-get update && apt-get install -y \
    build-essential gcc make python3 libvips-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

# Create app (Scaffolding runs install automatically)
RUN STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest . \
    --quickstart --no-run --skip-cloud

# Explicit install to ensure all dependencies are ready for build
RUN npm install
RUN NODE_ENV=production npm run build

# STAGE 2: Runtime
FROM node:20-slim
RUN apt-get update && apt-get install -y libvips && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

# Copy the fully built app
COPY --from=build /opt/app ./

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm", "run", "start"]