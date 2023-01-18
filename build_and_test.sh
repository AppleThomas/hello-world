#!/bin/bash

# Build the docker image and tag it
echo "Building Image"
docker build -t joeleav/hello-world:0.1.0 .

# Run the container in detached made using the created image
echo -e "\nRunning Container"
docker run --name hello-world-test -d -p 3000:3000 joeleav/hello-world:0.1.0

# Test a request to the container
echo -e "\nMaking Request\n"
curl localhost:3000

# Kill the container
echo -e "\nShutting Down"
docker kill $(docker ps -q --filter ancestor=joeleav/hello-world:0.1.0)
