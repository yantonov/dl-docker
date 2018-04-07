#!/bin/sh

IMAGE="keras"

IMAGE_ID=$(docker ps -a --filter "ancestor=${IMAGE}" --format '{{.ID}}' | head -n 1 || echo "")

if [ -z "${IMAGE_ID}" ]; then
    echo "Could not find image: '${IMAGE}'."
    exit 0
fi

docker stop "${IMAGE_ID}"
