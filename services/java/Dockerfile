ARG JAVA_VERSION

# Start from openjdk:xx-slim base image
FROM openjdk:${JAVA_VERSION}-slim

# change sources.list
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apt update && apt upgrade -y && \
    apt install git -y

# Set the Current Working Directory inside the container
WORKDIR /app
