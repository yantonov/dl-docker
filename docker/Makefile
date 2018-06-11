help:
	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=Dockerfile
BACKEND=tensorflow
SRC?=$(shell pwd)

IMAGE=yantonov/keras

build:
	docker build \
		--no-cache \
		-t $(IMAGE) \
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

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

push:
	docker login
	docker push "$(IMAGE)"


uninstall:
	docker image rm "$(IMAGE)"
