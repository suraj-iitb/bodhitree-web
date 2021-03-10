# Multi-stage
# 1) Node image for building frontend assets
# 2) nginx stage to serve frontend assets

# Stage 1
FROM node:15.8-buster-slim AS builder
# Working directory
WORKDIR /bodhitree-web
# Copy codebase
COPY . .
# Install prod dependencies & build the app for production
RUN npm install --production --silent --no-update-notifier && npm run build

# Stage 2
FROM nginx:1.19.7
# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=builder /bodhitree-web/build .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]