-- Time-stamp: <2019-01-18 15:06:46 (mellon@yavanna) collatz.hs>

import Data.List (maximumBy)
import Data.Ord (comparing)

collatz :: Int -> Int
collatz n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

hailstone :: Int -> [Int]
hailstone = takeWhile (/=1) . iterate collatz

longestChain :: Int
longestChain =
  fst $
  maximumBy (comparing snd) $ (,) <*> (length . hailstone) <$> [1 .. 10000]

-- Test

main :: IO ()
main =
  mapM_
  putStrLn
  [ "Collatz sequence for 27: "
  , (show . hailstone) 27
  , "The number " ++ show longestChain
  , "has the longest hailstone sequence for any number less than 10000. "
  , "The sequence has length: " ++ (show . length . hailstone $ longestChain)
  ]

