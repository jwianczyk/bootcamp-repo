#!/bin/bash

version=$1

# Build a docker image from dockerfile in the current directory
docker build -t myapp:"$version".0 .

# Link the image to remote AWS repo
docker tag myapp:"$version".0 211125446476.dkr.ecr.eu-central-1.amazonaws.com/myapp:"$version".0

# Push image to AWS repo
docker push 211125446476.dkr.ecr.eu-central-1.amazonaws.com/myapp:"$version".0