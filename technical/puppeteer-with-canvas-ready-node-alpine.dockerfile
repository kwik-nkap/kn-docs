# Use the official Node.js 18 Alpine image as a parent image
FROM node:21-alpine3.18

# Install system dependencies
# Alpine uses apk package manager instead of apt-get
# Dependencies necessary for canvas and puppeteer
RUN apk update && apk add --no-cache \
    python3 \
    make \
    g++ \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    curl \
    pkgconfig \
    udev \
    ttf-opensans \
    chromium \
    ca-certificates

# # The following dependencies are necessary for puppeteer
# RUN apk add --no-cache \
#     udev \
#     ttf-opensans \
#     chromium \
#     ca-certificates

# Image name is ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine

# Build the image with the following command (If running from a mac or windows, use the second command)
# docker build -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile .
# docker build --platform linux/amd64 -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile .

# Build and push for multiarch on mac arm with below
# docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile --push .