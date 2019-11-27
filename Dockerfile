FROM  node:alpine as builder

WORKDIR /app
COPY ./package.json ./
RUN npm install
RUN npm install -g @angular/cli@latest
COPY ./ ./

CMD ["npm","run","build"]

FROM nginx
COPY --from=builder /app/dist/ usr/share/nginx/html


