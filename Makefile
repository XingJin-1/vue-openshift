IMAGE_NAME = xing-vue-app-2-6
NAME = xing-vue-app-2-6
CONTAINER_ENGINE = docker

force-build:
	@${CONTAINER_ENGINE} build -t $(IMAGE_NAME) --no-cache .

build:
	@${CONTAINER_ENGINE} build -t $(IMAGE_NAME) .

push:
	@${CONTAINER_ENGINE} push $(IMAGE_NAME)
	
.PHONY: test
test:
	@${CONTAINER_ENGINE} run -d --rm --name $(NAME) -p 4200:4200 $(IMAGE_NAME)

service-build:
	oc new-app $(IMAGE_NAME)
	
expose:
	oc expose service vue-app-1 --port=8080
