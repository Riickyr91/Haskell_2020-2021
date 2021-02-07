divisores :: Integral a => a -> [a]
divisores num =
    [ x | x <- [1..num], (mod num x) == 0]

mult = 
    [x | x <- [1..], divisores x == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]]