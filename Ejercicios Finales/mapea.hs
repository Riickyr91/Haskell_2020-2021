mapea::(a -> b) -> [a] -> [b]
mapea p b = 
    [ p x | x <- b]