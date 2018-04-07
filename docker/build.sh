#!/bin/sh

DOCKER_FILE=Dockerfile
PYTHON_VERSION="3.6"
CUDA_VERSION="9.0"
CUDNN_VERSION="7"

docker build -t keras \
       --build-arg python_version=${PYTHON_VERSION} \
       --build-arg cuda_version=${CUDA_VERSION} \
       --build-arg cudnn_version=${CUDNN_VERSION} \
       -f ${DOCKER_FILE} .
