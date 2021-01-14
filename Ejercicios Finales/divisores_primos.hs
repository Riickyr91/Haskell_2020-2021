divisores :: Integral a => a -> [a]
divisores num =
    [ x | x <- [1..num], (mod num x) == 0]

primos :: Integral a => a -> Bool
primos num = length(divisores num) == 2
