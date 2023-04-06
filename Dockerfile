
FROM node:7       # this is the base image we are going to use to build our image
ADD app.js /app.js   # adding the source code to the container as a file. 
ENTRYPOINT ["node","app.js"]  # this is the default command that will run whne this container launches 
 
