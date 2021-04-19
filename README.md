# Haskell Parse CSV using Cassava

This example project parses a CSV file using
[cassava](http://hackage.haskell.org/package/cassava) package.

## Build

Build this project using [Cabal](#cabal):

```bash
cabal new-configure
cabal new-build
```

These commands are wrapped by GNU Make:

```bash
make
```

## Run

To run program over example data, [files/data.csv](files/data.csv) call:

```bash
make exec
```

This calls:

```bash
cabal new-run example
```

## References

* [Hackage: Cassava](https://hackage.haskell.org/package/cassava)
* [stackbuilders: CSV encoding and decoding in Haskell with Cassava](https://www.stackbuilders.com/tutorials/haskell/csv-encoding-decoding/)
