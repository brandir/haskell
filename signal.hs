-- Time-stamp: <2017-05-30 14:04:26 (mellon@yavanna) signal.hs>
-- cf. https://lotz84.github.io/haskellbyexample/ex/signals

import System.Exit
import System.Posix.Signals
import Control.Concurrent

main :: IO ()
main = do
  done <- newEmptyMVar
  let handler = do
         putStrLn ""
         putStrLn "interrupt"
         putMVar done ()
  installHandler keyboardSignal (Catch handler) Nothing
  putStrLn "awaiting signal"
  takeMVar done
  putStrLn "exiting"


