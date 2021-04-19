.PHONY: check tags style lint build test exec clean cleanall

SHELL	= /bin/sh
SUBS	:= $(wildcard */)
SRCS	:= $(wildcard $(addsuffix *.hs, $(SUBS)))

default: check build test

all:	check build test exec

check:	tags style lint

tags:
	@hasktags --ctags --extendedctag $(SRCS)

style:
	@stylish-haskell --config=.stylish-haskell.yaml --inplace $(SRCS)

lint:
	@hlint $(SRCS)

build:
	@cabal new-build

test:
	@cabal new-test

exec:
	@cabal new-run example

clean:
	@cabal new-clean

cleanall: clean
	@$(RM) -rf *.tix
