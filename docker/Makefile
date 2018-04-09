help:
	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=Dockerfile
BACKEND=tensorflow
PYTHON_VERSION?=3.6
CUDA_VERSION?=9.0
CUDNN_VERSION?=7
SRC?=$(shell pwd)

IMAGE="yantonov/keras"

build:
	docker build \
		-t $(IMAGE) \
		--build-arg python_version=$(PYTHON_VERSION) \
		--build-arg cuda_version=$(CUDA_VERSION) \
		--build-arg cudnn_version=$(CUDNN_VERSION) \
		-f $(DOCKER_FILE) .

notebook:
	mkdir -p $(DATA)
	docker run -i -t \
		-p 8888:8888 \
		-v "$(SRC):/src/workspace" \
		-v "$(DATA):/data" \
		--env KERAS_BACKEND=$(BACKEND) \
		--rm \
		$(IMAGE) \
		/bin/bash -c \
		"jupyter notebook \
		--notebook-dir=/src/workspace \
		--ip='*' \
		--port=8888 \
		--no-browser"

ssh:
	docker run --rm -t -i "$(IMAGE)" bash

uninstall:
	docker image rm "$(IMAGE)"

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"
