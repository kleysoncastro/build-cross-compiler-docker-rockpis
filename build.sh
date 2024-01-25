#!/usr/bin/env bash

# Remove Old Image

export DOCKER_IMAGE_NAME=cross-compile-ubuntu


#wget https://snapshots.linaro.org/gnu-toolchain/11.3-2022.06-1/aarch64-linux-gnu/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu.tar.xz

docker image rm -f $DOCKER_IMAGE_NAME

# No Cache Build
docker build --no-cache -t $DOCKER_IMAGE_NAME -f docker/Dockerfile .

