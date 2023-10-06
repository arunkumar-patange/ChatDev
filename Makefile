#
# Makefile
# make yaml_lint
#

SHELL := /bin/bash
HIDE ?= @
DOCKER_IMAGE ?= brain/chatdev
DOCKER_CONTAINER ?= ChatDev
VOLUME ?=-v $(PWD):/app -v $(DOCKER_CONTAINER)-venv:/venv
BRANCH_NAME ?= latest

-include utils/registry.mk

.PHONY: lint start

build:
	$(HIDE)docker build -f Dockerfile -t $(DOCKER_IMAGE) $(PWD)

start:
	$(HIDE)docker run -p8000 --env-file=./.env -it --entrypoint=/bin/bash --rm $(VOLUME) $(DOCKER_IMAGE)
