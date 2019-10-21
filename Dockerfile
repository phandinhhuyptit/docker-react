FROM node:alpine as builder

MAINTAINER KelvinPhan <phandinhhuyit@gmail.com>

WORKDIR /usr/app

RUN npm i -g yarn

COPY  package.json .

RUN yarn install

COPY  . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html

