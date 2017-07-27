#!/bin/sh

pm2 start process.yml

# @XXX  nginx alpine build defaults the pid location to /run/xxx which causing errors, see quick fix
#       credits: https://github.com/gliderlabs/docker-alpine/issues/185#issuecomment-229118022
nginx -g 'pid /tmp/nginx.pid; daemon off;'
