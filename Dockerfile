# STAGE 1: Build
FROM node:20-slim AS build

RUN apt-get update && apt-get install -y \
    build-essential gcc make python3 libvips-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
# Ensure we are using --yes and the correct path
RUN STRAPI_TELEMETRY_DISABLED=true npx --yes create-strapi-app@latest ./strapi-app \
    --quickstart --no-run --skip-cloud

# Move into the specific folder created above
WORKDIR /opt/strapi-app
RUN npm run build

# STAGE 2: Runtime
FROM node:20-slim
RUN apt-get update && apt-get install -y libvips && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/strapi-app
# Copy from the specific folder
COPY --from=build /opt/strapi-app ./

ENV NODE_ENV=production
EXPOSE 1337
CMD ["npm", "run", "start"]