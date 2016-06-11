module Main where

import Network.Stockfighter.Trade
import System.Environment (getArgs)
import System.Exit (die)

import FirstSteps as One
import ChockABlock as Two

main :: IO ()
main = do
  args <- getArgs
  if length args < 2 then die $ "Not enough arguments given\n" ++ help else return ()
  let apikey = args !! 1
  case head args of
    "one" -> firstSteps apikey
    "two" -> chockABlock apikey
    x     -> die $ "Invalid level: " ++ x

help :: String
help = unlines [take 10 $ repeat '-', "prog level apikey"]

firstSteps :: APIKey -> IO ()
firstSteps apikey = One.performOrder apikey

chockABlock :: APIKey -> IO ()
chockABlock apikey = Two.performOrders apikey
