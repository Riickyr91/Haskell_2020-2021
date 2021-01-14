{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
traduce::(Eq a, Num a) => a -> [Char]
{- PROPÓSITO
-}
-- DEFINICIÓN
traduce x = case x of
    1 -> "A"
    2 -> "B"
    3 -> "C"
{- ------------------------------------------- -}