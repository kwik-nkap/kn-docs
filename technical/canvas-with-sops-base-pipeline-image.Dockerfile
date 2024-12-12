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
    curl \
    pkgconfig

# Install sops (Done as root user before switching to node user)
RUN curl -L https://github.com/getsops/sops/releases/download/v3.9.0/sops-v3.9.0.linux.amd64 -o sops
RUN chmod a+x sops
RUN mv sops /usr/local/bin/sops

# Image name is ghcr.io/kwik-nkap/base-with-canvas-sops-node:21


# Run the below command in the pipeline image to remove unneeded build dependencies that were only needed for canvas install
# RUN apk del python3 make g++ # Remove unnecessary build dependencies

# Build the image with the following command (If running from a mac or windows, use the second command)
# docker build -t ghcr.io/kwik-nkap/base-with-canvas-sops-node:21 -f canvas-with-sops-base-pipeline-image.Dockerfile .
# docker build --platform linux/amd64 -t ghcr.io/kwik-nkap/base-with-canvas-sops-node:21 -f canvas-with-sops-base-pipeline-image.Dockerfile .
