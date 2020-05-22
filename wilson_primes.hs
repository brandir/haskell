-- Time-stamp: <2017-06-07 11:04:18 (mellon@yavanna) wilson_primes.hs>
-- cf. https://www.reddit.com/r/haskell/comments/35vc31/the_real_way_to_generate_a_list_of_primes_in/

primes = [n | n<-[2..], product [1..n-1] `rem` n == n-1]
main = do
  print primes
