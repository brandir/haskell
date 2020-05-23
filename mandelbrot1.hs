-- Time-stamp: <2020-05-23 12:39:46 (mellon@arda.dps.net) mandelbrot1.hs>
-- Cf. rosettacode.org

import Data.Bool
import Data.Complex (Complex((:+)), magnitude)

mandelbrot
  :: RealFloat a
  => Complex a -> Complex a
mandelbrot a = iterate ((a +) . (^ 2)) 0 !! 50

main :: IO ()
main =
  mapM_
  putStrLn
  [ [ bool ' ' '*' (2 > magnitude (mandelbrot (x :+ y)))
    | x <- [-2,-1.9685 .. 0.5] ]
  | y <- [1,0.95 .. -1] ]
  
