module FirstSteps where

import Network.Stockfighter.Trade

performOrder :: APIKey -> IO String
performOrder apikey = response
  where response = requestOrder order apikey
        order  = Order {
            account   = "CAE46231117"
          , venue     = "ETWTEX"
          , symbol    = "KUIV"
          , price     = 3800
          , quantity  = 100
          , direction = Buy
          , orderType = Limit
        }
