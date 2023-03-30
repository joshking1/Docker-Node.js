# Docker-Node.js

docker run -d -p 3000:3000 -p 3001:3001 -p 3002:3002 \
-e PORT=3000 -e RESPONSE='Hello from microservice 1!' \
-e PORT=3001 -e RESPONSE='Hello from microservice 2!' \
-e PORT=3002 -e RESPONSE='Hello from microservice 3!' \
--name microservices josh 

In this command, we're running a Docker container named microservices based on the my-node-app image. We're using the -d flag to run the container in detached mode, and the -p flag to map the container ports to the host ports. We're also setting environment variables for each microservice's port number and response message using the -e flag.

Assuming that your Node.js application reads the PORT and RESPONSE environment variables to start the server with the specified port number and response message, this docker run command should start all three microservices and make them accessible on the host machine on ports 3000, 3001, and 3002.

