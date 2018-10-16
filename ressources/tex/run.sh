#!/bin/bash

# Volumes: folders shared between hosts and docker containers
export VOLUME_TEX="$PWD/:/data/"
# Docker image related informations
export DOCKER_IMAGE_NAME="zigarn/gitdags"
export DOCKER_IMAGE_VERSION="latest"

docker run -it --rm \
        -v "$VOLUME_TEX" \
        "$DOCKER_IMAGE_NAME":"$DOCKER_IMAGE_VERSION" \
        -v *.tex */*.tex
