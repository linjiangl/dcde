# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang:1.18.1-alpine base image
FROM golang:1.18.1-alpine

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Set the Current Working Directory inside the container
WORKDIR /app

COPY go.mod go.sum ./

# Download all dependancies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

COPY . .

# Build the Go app
RUN go build -o main .

# Run the executable
CMD ["./main"]