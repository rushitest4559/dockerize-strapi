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
