FROM node:20-alpine

WORKDIR /app

RUN npm install -g create-strapi-app@4

RUN npx create-strapi-app@4 . \
  --quickstart \
  --no-run \
  --skip-cloud

RUN npm install pg

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "develop"]
