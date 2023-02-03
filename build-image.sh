#!/bin/bash

# Clone the Git repository
git clone https://github.com/joshking1/Docker-Node.js.git

# Change directory to Docker-Node.js
cd Docker-Node.js

# Build the Docker image
docker build -t king-httpd .

# Tag the image
docker tag king-httpd josh1991/king-httpd

# Set Docker Hub credentials as environment variables
DOCKER_USERNAME=josh1956
DOCKER_PASSWORD=Josh@12345

# Login to Docker Hub
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push josh1991/king-httpd
