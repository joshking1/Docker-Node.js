#!/bin/bash

# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Install Docker
sudo apt-get install -y docker.io

# Start Docker daemon
sudo systemctl start docker

# Enable Docker daemon to start at boot
sudo systemctl enable docker

# Clone the Git repository
git clone https://github.com/joshking1/Docker-Node.js.git

# Change directory to Docker-Node.js
cd Docker-Node.js

# Build the Docker image
docker build -t king-httpd .

# Tag the image
docker tag king-httpd josh1991/king-httpd

# Set Docker Hub credentials as environment variables
# To set these environment variables on your terminal, you can run the following two commands, 
# replacing josh1956 with your Docker Hub username and Josh@12345 with your Docker Hub password:
# export DOCKER_USERNAME=josh1956
# export DOCKER_PASSWORD=Josh@12345

# Login to Docker Hub
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push josh1991/king-httpd
