FROM node:20.0.0-alpine as build
RUN mkdir -p /app

WORKDIR /app

COPY package*.json /app/
RUN npm install

COPY . /app/

RUN npm run build --prod

FROM nginx:1.21.3-alpine

COPY --from=build /app/dist/angular-tour-of-heroes /usr/share/nginx/html




