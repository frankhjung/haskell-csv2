{-# LANGUAGE ScopedTypeVariables #-}

{-|
A program to read a CSV. This example came from
[Hackage: Cassava](https://hackage.haskell.org/package/cassava)
-}

import           Data.ByteString.Lazy as BL (readFile)
import           Data.Csv             (HasHeader (..), decode)
import           Data.Vector          as V (Vector, mapM_)

-- | Print the earnings read from the CSV file.
-- The format of the CSV is known, so we can use a tuple to represent the data.
showEarning :: Vector (String, Int) -> IO ()
showEarning = V.mapM_ (putStrLn . fmtEarnings)
    where
        fmtEarnings :: (String, Int) -> String
        fmtEarnings (name, salary) = name <> " earns " <> show salary <> " dollars"

-- | Simple example of how to parse a CSV file.
main :: IO ()
main = do
    csvData <- BL.readFile "files/data.csv"
    case decode HasHeader csvData of    -- ignore header
        Left err -> putStrLn err        -- handle errors
        Right v  -> showEarning v       -- print earnings read from the CSV
