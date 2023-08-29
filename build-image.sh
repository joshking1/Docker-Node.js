#!/bin/bash
echo "patch management for the server"
sudo apt-get update -y && sudo apt-get upgrade -y

echo "install docker"
sudo apt install docker.io -y

echo "Start Docker daemon"
sudo systemctl start docker

echo "Enable Docker daemon to start at boot"
sudo systemctl enable docker

echo "Check the Git version"
git --version

echo "clone the Git repository"
git clone https://github.com/batokenms/Docker-Node.js.git

echo "Change directory to Docker-Node.js"
cd Docker-Node.js

echo "Build the Docker image"
docker build -t jean-httpd .

echo "Tag the image"
docker tag jean-httpd jeanp12/jean-httpd

echo "Login to Docker Hub"
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

echo "Push the image to Docker Hub"
docker push jeanp12/jean-httpd
