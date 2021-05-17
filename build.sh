#!/bin/sh

# to run docker container to build on macos, run below command:
# docker run -v $(pwd):/root/npd -v /var/run/docker.sock:/var/run/docker.sock -it golang:1.16-alpine "/bin/sh"

### enable on macos
apk update
apk add --no-cache gcc libc-dev make git docker
###

docker system prune -af
make
docker tag gcr.io/k8s-staging-npd/node-problem-detector:v0.8.6-74-g53f37a6-dirty bilalcaliskan/node-problem-detector:latest
docker push bilalcaliskan/node-problem-detector:latest

# TODO: consider changing the taint with node-problem-detector/ReadonlyFilesystem