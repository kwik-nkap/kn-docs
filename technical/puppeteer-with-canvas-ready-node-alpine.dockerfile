# Use the official Node.js 18 Alpine image as a parent image
FROM node:21-alpine3.18

# Set the working directory
WORKDIR /usr/src/app

# Install system dependencies
# Alpine uses apk package manager instead of apt-get
# Dependencies necessary for canvas and puppeteer
RUN apk update && apk add --no-cache --virtual \
    .build-deps \
    udev \
    ttf-opensans \
    chromium \
    ca-certificates \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    curl \
    pkgconfig

# # The following dependencies are necessary for puppeteer
# RUN apk add --no-cache \
#     python3 \
#     make \
#     g++ \
#     cairo-dev \
#     pango-dev \
#     jpeg-dev \
#     giflib-dev \
#     curl \
#     pkgconfig

# Image name is ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine


# Run the below command in the pipeline image to remove unneeded build dependencies that were only needed for canvas install
# RUN apk del python3 make g++ # Remove unnecessary build dependencies

# Build the image with the following command (If running from a mac or windows, use the second command)
# docker build -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile .
# docker build --platform linux/amd64 -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile .

# Build for mac arm with below
# docker build --platform linux/amd64 -t ghcr.io/kwik-nkap/base-with-canvas-puppeteer-node:21-alpine -f puppeteer-with-canvas-ready-node-alpine.Dockerfile .