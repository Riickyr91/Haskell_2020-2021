{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
divisible::Int->Int->Bool
{- PROPÓSITO
-}
-- DEFINICIÓN
divisible x y = resto == 0
    where resto = mod x y
{- ------------------------------------------- -}
