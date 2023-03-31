# Docker-Node.js

docker run -d -p 3000:3000 -p 3001:3001 -p 3002:3002 \
-e PORT=3000 -e RESPONSE='Hello from microservice 1!' \
-e PORT=3001 -e RESPONSE='Hello from microservice 2!' \
-e PORT=3002 -e RESPONSE='Hello from microservice 3!' \
--name microservices josh 

In this command, we're running a Docker container named microservices based on the my-node-app image. We're using the -d flag to run the container in detached mode, and the -p flag to map the container ports to the host ports. We're also setting environment variables for each microservice's port number and response message using the -e flag.

Assuming that your Node.js application reads the PORT and RESPONSE environment variables to start the server with the specified port number and response message, this docker run command should start all three microservices and make them accessible on the host machine on ports 3000, 3001, and 3002.

# Can you run multiples microservices in single container 

Technically, it is possible to run multiple microservices in a single container, but it is not considered a best practice. The main reason for this is that microservices are designed to be independent and decoupled, and running multiple microservices in a single container would violate this principle.

Running multiple microservices in a single container would also make it difficult to scale and manage them independently. For example, if one microservice needs more resources than the others, you would have to scale the entire container, which could result in wasted resources for the other microservices.

Additionally, running multiple microservices in a single container could introduce security and reliability risks. If one microservice crashes or experiences a security breach, it could potentially affect the other microservices running in the same container.

Therefore, it is generally recommended to run each microservice in its own container, which provides better isolation, scalability, and manageability. You can use container orchestration tools like Docker Compose, Kubernetes, or Docker Swarm to manage multiple containers and microservices as a single application.

# Check how much resources a contaier is using 

You can use the top command on Ubuntu to see how much CPU and memory each microservice is using. 

Open a terminal window on Ubuntu.

Run the following command to list the running Docker containers and their container IDs:

# docker ps

This will show you a list of running Docker containers along with their container IDs, names, images, and other details.

Note the container ID of the microservices container that you want to check the resource usage for.

Run the following command to open the top utility and filter the output by the container ID:

# top -p $(docker inspect --format {{.State.Pid}} <container-id>)
  
Replace <container-id> with the actual container ID from step 3.

This will open the top utility and show you the resource usage (CPU, memory, etc.) for the processes running inside the specified Docker container.

Note that the top utility updates in real-time, so you can monitor the resource usage over time to see how it changes.

When you're done monitoring the resource usage, you can exit the `top

  
# Remove a running container 

If you have a container that is consuming the most resources on your server and you want to remove it, you can use the docker rm command to remove the container. 

Open a terminal window on your server.

Use the docker ps command to list all running containers:

# docker ps
  
This will show you a list of running Docker containers along with their container IDs, names, images, and other details.

Identify the container that is consuming the most resources by looking at the CPU% and MEM USAGE columns in the output of the docker ps command.

Use the docker stop command to stop the container:

# docker stop <container-id>
  
Replace <container-id> with the actual container ID of the container you want to stop.

This will stop the container, freeing up the resources it was consuming.

Use the docker rm command to remove the container:

# docker rm <container-id>
  
Replace <container-id> with the actual container ID of the container you want to remove.

This will remove the container from your server, freeing up any disk space it was using.

Note that if you want to remove a container that is still running, you'll need to stop it first using the docker stop command before you can remove it using the docker rm command.

Also, be careful when removing containers, as any data or changes made inside the container will be lost once it is removed.
  
# Remove Docker images

To remove all Docker images from your local Docker registry, you can use the docker rmi command with a combination of $(docker images -q) and --force flags. Here's the command:

# docker rmi $(docker images -q) --force
  
This command will first list all Docker image IDs using docker images -q, and then remove all those images using docker rmi. The --force flag is added to force removal of the images without asking for confirmation.

Note that this command will remove all Docker images from your local registry, including ones that are in use by running containers. If you want to remove only unused images, you can add the --filter dangling=true flag to the docker images command to list only unused images, like this:

# docker rmi $(docker images -q --filter dangling=true) --force
  
This command will remove only the unused Docker images from your local registry.
