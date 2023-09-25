import os

# Update packages and install security patches
os.system("sudo apt-get update")
os.system("sudo apt-get upgrade -y")

# Install Docker
os.system("sudo apt-get install -y docker.io")

# Start Docker daemon
os.system("sudo systemctl start docker")

# Enable Docker daemon to start at boot
os.system("sudo systemctl enable docker")

# Clone the Git repository
os.system("git clone https://github.com/joshking1/Docker-Node.js.git")

# Change directory to Docker-Node.js
os.chdir("Docker-Node.js")

# Build the Docker image
os.system("docker build -t king-httpd .")

# Tag the image
os.system("docker tag king-httpd josh1991/king-httpd")

# Set Docker Hub credentials as environment variables
# To set these environment variables on your terminal, you can run the following two commands, 
# replacing josh1956 with your Docker Hub username and Josh@12345 with your Docker Hub password:
# export DOCKER_USERNAME=josh1956
# export DOCKER_PASSWORD=Josh@12345

# Login to Docker Hub
docker_login_command = f"echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"

# Push the image to Docker Hub
os.system("docker push josh1991/king-httpd")
