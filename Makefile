#!/usr/bin/env make

.DEFAULT_GOAL := default

SRC	:= $(shell git ls-files | grep --perl \.hs)
YAML	:= $(shell git ls-files | grep --perl \.y?ml)
TARGET	:= csv2

.PHONY: default
default: format check build exec

.PHONY: all
all:	format check build doc exec

.PHONY: format
format:
	@echo format ...
	@stylish-haskell --config=.stylish-haskell.yaml --inplace $(SRC)
	@cabal-fmt --inplace $(TARGET).cabal

.PHONY: check
check:	tags lint

.PHONY: tags
tags:
	@echo tags ...
	@hasktags --ctags --extendedctag $(SRC)

.PHONY: lint
lint:
	@echo lint ...
	@cabal check --verbose
	@hlint --cross --color --show $(SRC)
	@yamllint --strict $(YAML)

.PHONY: build
build:
	@echo build ...
	@stack build --pedantic

.PHONY: doc
doc:
	@echo doc ...
	@stack haddock

.PHONY: exec
exec:
	@stack exec -- main

.PHONY: setup
setup:
	stack path
	stack query
	stack ls dependencies

.PHONY: clean
clean:
	@stack clean

.PHONY: cleanall
cleanall: clean
	@stack purge
	@rm -f stack.yaml.lock