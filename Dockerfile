FROM node:boron-alpine

LABEL maintainer="richard@mindginative.com"

WORKDIR /var/www/dangx

# Install Alpine packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    nginx

ADD package.json package.json
ADD scripts scripts
ADD config/nginx.conf /etc/nginx/nginx.conf

RUN npm install pm2 -g && \
    npm install
RUN chmod +x ./scripts/docker-cmd-start.sh

EXPOSE 8080

CMD ["./scripts/docker-cmd-start.sh"]
