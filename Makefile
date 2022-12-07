all: build build-slim

IMAGE=coderockr/node-for-build
TAG=$(shell git branch | grep \* | cut -d ' ' -f2)

build-slim:
	docker build --pull . -f Dockerfile.slim -t $(IMAGE):$(TAG)-slim

build:
	docker build --pull . -t $(IMAGE):$(TAG)

push: build
	docker push $(IMAGE):$(TAG)

push-slim: build-slim
	docker push $(IMAGE):$(TAG)-slim
