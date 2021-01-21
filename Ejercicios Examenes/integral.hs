integral :: (Num a, Enum a) => (a -> a) -> a -> a -> a -> a
integral funcion a b t = 
    sum [(funcion x) * t| x <- [a, a + t..b-t]]