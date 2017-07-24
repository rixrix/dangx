FROM node:boron-alpine

WORKDIR /home/root

# Install Alpine packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    nginx

ADD public/ public/
ADD scripts/ scripts/
ADD app.js app.js
ADD package.json package.json
ADD nginx.conf /etc/nginx/nginx.conf

RUN npm install
RUN chmod +x ./scripts/start-server.sh

EXPOSE 9000

CMD ["./scripts/start-server.sh"]
