ARG GOLANG_VERSION

# Start from golang:1.18.1-alpine base image
FROM golang:${GOLANG_VERSION}

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Set the Current Working Directory inside the container
WORKDIR /app