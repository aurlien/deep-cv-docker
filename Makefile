PROJECT_DIR = $(shell pwd)
TARGET_DIR = /app
USE_GPU = True

ifeq ($(USE_GPU),True)
	DOCKERFILE = Dockerfile.gpu
	DOCKERTAG = deep-cv:gpu
	DOCKER_CMD = nvidia-docker
else
	DOCKERFILE = Dockerfile
	DOCKERTAG = deep-cv
	DOCKER_CMD = docker
endif

DOCKER_IMG = aurlien/$(DOCKERTAG)


build:
	docker build -t $(DOCKERTAG) -f $(DOCKERFILE) .

tag: build
	docker tag $(DOCKERTAG) $(DOCKER_IMG)

push: tag
	docker push $(DOCKER_IMG)

pull:
	@echo // Pulling from DockerCloud 
	docker pull $(DOCKER_IMG)

bash: pull 
	@echo // Running image with bash
	docker run -it \
		--mount type=bind,source=$(PROJECT_DIR),target=$(TARGET_DIR) \
		$(DOCKER_IMG) \
		bash

jupyter: pull
	@echo // Running image with jupyter
	$(DOCKER_CMD) run -d \
		--mount type=bind,source=$(PROJECT_DIR),target=$(TARGET_DIR) \
		-p 8888:8888 \
		-p 6006:6006 \
		$(DOCKER_IMG)
