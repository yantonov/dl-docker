help:
	@cat Makefile

DATA?="${HOME}/Data"
DOCKER_FILE=Dockerfile
BACKEND=tensorflow
SRC?=$(shell pwd)
CONTAINER_SRC=/src/workspace
CONTAINER_DATA=/data

IMAGE=yantonov/dl-cpu

build:
	docker build \
		--no-cache \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

notebook:
	mkdir -p $(DATA)
	docker run \
		--hostname localhost \
		-i -t \
		-p 8888:8888 \
		-p 6006:6006 \
		-v "$(SRC):$(CONTAINER_SRC)" \
		-v "$(DATA):$(CONTAINER_DATA)" \
		--env KERAS_BACKEND=$(BACKEND) \
		--rm \
		$(IMAGE) \
		"jupyter notebook \
		--notebook-dir=$(CONTAINER_SRC) \
		--ip=0.0.0.0 \
		--port=8888 \
		--no-browser"

lab:
	mkdir -p $(DATA)
	docker run \
		--hostname localhost \
		-i -t \
		-p 8888:8888 \
		-p 6006:6006 \
		-v "$(SRC):$(CONTAINER_SRC)" \
		-v "$(DATA):$(CONTAINER_DATA)" \
		--env KERAS_BACKEND=$(BACKEND) \
		--rm \
		$(IMAGE) \
		"jupyter lab \
		--notebook-dir=$(CONTAINER_SRC) \
		--ip=0.0.0.0 \
		--port=8888 \
		--no-browser"

ssh:
	docker run --rm -u 0 -t -i "$(IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

push:
	docker login
	docker push "$(IMAGE)"


uninstall:
	docker image rm "$(IMAGE)"
