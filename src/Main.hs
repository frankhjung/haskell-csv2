{-# LANGUAGE ScopedTypeVariables #-}

{-|
 A program to read a CSV. This example came from
 [Hackage: Cassava](https://hackage.haskell.org/package/cassava)
 -}

import           Data.ByteString.Lazy as BL (readFile)
import           Data.Csv             (HasHeader (..), decode)
import           Data.Vector          as V (forM_)

-- | Parse a example CSV file.
main :: IO ()
main = do
    csvData <- BL.readFile "files/data.csv"
    case decode HasHeader csvData of
        Left err -> putStrLn err
        Right v -> V.forM_ v $ \ (name, salary :: Int) ->
            putStrLn $ name ++ " earns " ++ show salary ++ " dollars"
