#!/bin/bash

# Check for and install Docker
if command -v docker &> /dev/null; then
    echo "Docker is already installed"
else
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Check for and install Git
if command -v git &> /dev/null; then
    echo "Git is already installed"
else
    echo "Installing Git..."
    sudo apt-get update
    sudo apt-get install -y git
fi

# Check for and install JDK 11
if command -v java &> /dev/null && java -version 2>&1 | grep -q "11\."; then
    echo "JDK 11 is already installed"
else
    echo "Installing JDK 11..."
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
fi

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
