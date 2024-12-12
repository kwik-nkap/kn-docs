# Prepare the image when build
FROM node:21-alpine3.18

RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    pkgconfig



# Image name is ghcr.io/kwik-nkap/base-with-canvas-node:21


# Run the below command in the pipeline image to remove unneeded build dependencies that were only needed for canvas install
# RUN apk del python3 make g++ # Remove unnecessary build dependencies

# Build the image with the following command (If running from a mac or windows, use the second command)
# docker build -t ghcr.io/kwik-nkap/base-with-canvas-node:21 -f canvas-base-pipeline-image.Dockerfile .
# docker build --platform linux/amd64 -t ghcr.io/kwik-nkap/base-with-canvas-node:21 -f canvas-base-pipeline-image.Dockerfile .