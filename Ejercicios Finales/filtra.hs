filtra::(a->Bool) -> [a] -> [a]
filtra p b = 
    [ x | x <- b, p x == True]