ARG NODE_VERSION

# Start from golang:xx-alpine base image
FROM node:${NODE_VERSION}-alpine

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN npm -v && npm config set registry http://registry.npmmirror.com && \
    npm install -g nrm && nrm ls && nrm use taobao

# Set the Current Working Directory inside the container
WORKDIR /app