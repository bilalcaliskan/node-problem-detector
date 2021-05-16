#!/usr/bin/bash

docker system prune -af
make
docker tag gcr.io/k8s-staging-npd/node-problem-detector:v0.8.6-73-g4639115-dirty bilalcaliskan/node-problem-detector:latest
docker push bilalcaliskan/node-problem-detector:latest