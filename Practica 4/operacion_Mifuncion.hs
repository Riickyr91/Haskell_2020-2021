miFuncion::[(a->b)] -> [a] -> [b]
miFuncion [] _ = []
miFuncion (f:fs) (x:xs) = (f x):(miFuncion fs xs)