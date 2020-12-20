TOP_DIR=.
README=$(TOP_DIR)/README.md

VERSION=$(strip $(shell cat version))

build: init
	@echo "Building the software..."
	@yarn link @arcblock/did-playground
	@yarn build

init: install dep
	@echo "Initializing the repo..."

install:
	@echo "Install software required for this repo..."
	@npm install -g lerna yarn @abtnode/cli @babel/cli

dep:
	@echo "Install dependencies required for this repo..."
	@lerna bootstrap

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
	@lerna run coverage

lint:
	@echo "Linting the software..."
	@lerna run lint

precommit: dep lint test coverage

github-init:
	@sudo npm install -g lerna
	@make precommit

clean:
	@echo "Cleaning the build..."

run:
	@echo "Running the software..."
	@yarn start

include .makefiles/*.mk

.PHONY: build init install dep pre-build post-build all test doc precommit github-action-test clean watch run bump-version create-pr
