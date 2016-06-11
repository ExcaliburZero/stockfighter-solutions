module ChockABlock where

import Control.Concurrent (threadDelay)
import Control.Monad (replicateM_)
import Network.Stockfighter.Trade

-- | Continually place orders of the same price at 5 second intervals.
performOrders :: APIKey -> IO ()
performOrders apikey = do
    putStrLn $ unwords ["Will run for", (show totalMinutes), "minutes."]
    replicateM_ orders orderAndWait
  where waitTime = 5000000
        orderAndWait = do
          response <- requestOrder order apikey
          putStrLn response
          threadDelay waitTime
        order = Order {
            account   = "MS43839686"
          , venue     = "JBEYEX"
          , symbol    = "HBI"
          , price     = 2600
          , quantity  = stocksPerOrder
          , direction = Buy
          , orderType = Limit
        }
        totalStocks    = 100000
        stocksPerOrder = 500
        orders         = totalStocks `div` stocksPerOrder
        totalMinutes   = fromIntegral orders * (fromIntegral waitTime / 1000000) / 60
