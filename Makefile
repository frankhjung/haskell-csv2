.PHONY: all check default tags style lint build test exec clean cleanall

SRC	:= $(shell git ls-files | grep --perl \.hs)

default: all

all:	check build exec

check:	tags style lint

tags:
	@hasktags --ctags --extendedctag $(SRC)

style:
	@stylish-haskell --config=.stylish-haskell.yaml --inplace $(SRC)

lint:
	@hlint $(SRC)

build:
	@cabal build

test:
	@cabal test

exec:
	@cabal run example

clean:
	@cabal clean

cleanall: clean
	@$(RM) -rf *.tix
