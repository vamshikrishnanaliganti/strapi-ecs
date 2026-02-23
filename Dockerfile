FROM node:18-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG NODE_ENV=production
ARG HOST=0.0.0.0
ARG PORT=1337

ENV NODE_ENV=$NODE_ENV
ENV HOST=$HOST
ENV PORT=$PORT

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]