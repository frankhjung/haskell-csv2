{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import           Lib                  (showEarning)

import           Data.ByteString.Lazy as BL (readFile)
import           Data.Csv             (HasHeader (..), decode)


-- | Simple example of how to parse a CSV file.
main :: IO ()
main = do
    csvData <- BL.readFile "files/data.csv"
    case decode HasHeader csvData of    -- ignore header
        Left err -> putStrLn err        -- handle errors
        Right v  -> showEarning v       -- print earnings read from the CSV
