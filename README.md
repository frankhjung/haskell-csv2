# Haskell Parse CSV using Cassava

This example project parses a CSV file using
[cassava](http://hackage.haskell.org/package/cassava) package.

## Build

Build this project using [Stack](stack.yaml) coordinated by [make](Makefile).

```bash
make clean all
```

## Run

To run program over example data, [files/data.csv](files/data.csv) call:

```bash
make exec
```

To run using Stack:

```bash
stack exec -- main
```

###### Example

```bash
$ stack exec -- main
Aaron earns 50000 dollars
Brian earns 60000 dollars
Clair earns 55000 dollars
David earns 40000 dollars
```

## REPL

To start REPL using Stack:

```bash
stack repl --package bytestring --package cassava --package vector
```

Or, more simply:

```bash
stack ghci
```

## Documentation

The build includes a target to build
[Haddock](http://hackage.haskell.org/package/haddock) documentation.

The documentation is publish to https://frankhjung1.gitlab.io/haskell-csv2/.

## References

* [GNU Make](https://www.gnu.org/software/make/)
* [Hackage: Cassava](https://hackage.haskell.org/package/cassava)
* [stackbuilders: CSV encoding and decoding in Haskell with Cassava](https://www.stackbuilders.com/tutorials/haskell/csv-encoding-decoding/)
