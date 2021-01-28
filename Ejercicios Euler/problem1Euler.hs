multiplos :: Integral a => a -> a
multiplos num =
    sum [ x | x <- [1..num], (mod x 3) == 0 || (mod x 5) == 0 ]