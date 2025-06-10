.PHONY: build ci

CONTAINER_NAME="ansible-lint"
CONTAINER_TAG="local"

ci:
	bash run-ci.sh

build:
	docker buildx build -t "docdee/$(CONTAINER_NAME):$(CONTAINER_TAG)" -f Dockerfile --load .
	docker images | grep "${CONTAINER_NAME}"