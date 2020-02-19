FROM nginx:1.17.8-alpine

# Update and add bash
RUN apk update && apk add bash

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx config to container
COPY ./nginx.conf /etc/nginx/conf.d