{- ------------------ -}
-- Declaracion
cuantosIguales:: Int->Int->Int->Int
{- Proposito
-}
-- Definicion
cuantosIguales x y z 
    = if(x == y && y == z) then 3 
    else 
        if (x == y || y == z) then 2 else 0
{- ------------------ -}