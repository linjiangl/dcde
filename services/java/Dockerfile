ARG JAVA_VERSION
# Start from openjdk:xx-slim base image
FROM openjdk:${JAVA_VERSION}-slim

ARG DEBIAN_MIRROR_DOMAIN

# Set debian mirror
RUN sed -i "s|deb.debian.org|${DEBIAN_MIRROR_DOMAIN}|g" /etc/apt/sources.list.d/debian.sources

# Install required packages
RUN export option="--no-install-recommends -y" \
    && apt-get $option update \
    && apt-get $option install git openssh-client curl vim rsync procps iputils-ping vim-tiny unzip htop tzdata

# Set the Current Working Directory inside the container
WORKDIR /app
