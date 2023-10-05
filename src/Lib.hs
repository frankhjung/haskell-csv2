{-# LANGUAGE ScopedTypeVariables #-}
module Lib (showEarning) where

{-|
A program to read a CSV. This example came from
[Hackage: Cassava](https://hackage.haskell.org/package/cassava).
-}

import           Data.Vector as V (Vector, mapM_)

-- | Print the earnings read from the CSV file.
-- The format of the CSV is known as a String and Int tuple.
showEarning :: Vector (String, Int) -> IO ()
showEarning = V.mapM_ (putStrLn . fmtEarnings)
  where
    fmtEarnings :: (String, Int) -> String
    fmtEarnings (name, salary) = name <> " earns " <> show salary <> " dollars"
