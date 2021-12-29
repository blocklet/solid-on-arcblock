TOP_DIR=.
README=$(TOP_DIR)/README.md

VERSION=$(strip $(shell cat version))

build: init
	@echo "Building the software..."
	@yarn build

init: install dep
	@echo "Initializing the repo..."

install:
	@echo "Install software required for this repo..."
	@yarn global add @blocklet/cli

dep:
	@echo "Install dependencies required for this repo..."
	@yarn --ignore-engines

pre-build: install dep
	@echo "Running scripts before the build..."

post-build:
	@echo "Running scripts after the build is done..."

all: pre-build build post-build

test:
	@echo "Running test suites..."

doc:
	@echo "Building the documenation..."

coverage:
	@echo "Collecting test coverage ..."

lint:
	@echo "Linting the software..."

precommit: dep lint test coverage

github-init:
	@make precommit

clean:
	@echo "Cleaning the build..."

run:
	@echo "Running the software..."

include .makefiles/*.mk

.PHONY: build init install dep pre-build post-build all test doc precommit github-action-test clean watch run bump-version create-pr
