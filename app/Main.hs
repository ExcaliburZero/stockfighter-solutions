module Main where

import Network.Stockfighter.Trade
import System.Environment (getArgs)
import System.Exit (die)

import FirstSteps as One

main :: IO ()
main = do
  args <- getArgs
  if length args < 2 then die $ "Not enough arguments given\n" ++ help else return ()
  response <- case head args of
                "one" -> firstSteps $ args !! 1
  putStrLn response

help :: String
help = unlines [take 10 $ repeat '-', "prog level apikey"]

firstSteps :: APIKey -> IO String
firstSteps apikey = One.performOrder apikey
