#!/bin/sh

cd "$(dirname "$0")"

DATA=${HOME}/Data
KERAS_BACKEND=tensorflow
NOTEBOOK_LOCAL_DIR="$(pwd)"

mkdir -p "${DATA}"

docker run -i -t \
           -p 8888:8888 \
           -v "${NOTEBOOK_LOCAL_DIR}:/src/workspace" \
           -v "${DATA}:/data" \
           --env KERAS_BACKEND=${KERAS_BACKEND} \
           --rm \
           yantonov/keras \
           /bin/bash -c \
           "jupyter notebook \
       --notebook-dir=/src/workspace \
       --ip='*' \
       --port=8888 \
       --no-browser"
