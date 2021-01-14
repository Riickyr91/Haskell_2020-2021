{- ------------------ -}
-- Declaracion
maximo2 :: Fractional a => a -> a -> a
{- Proposito
-}
-- Definicion
maximo2 x y = ((x+y) + abs(x-y))/2
{- ------------------ -}

{- ------------------ -}
-- Declaracion
maximo3 :: Fractional a => a-> a-> a-> a
{- Proposito
-}
-- Definicion
maximo3 x y z = maximo2 (maximo2 x y)  (maximo2 x z)
{- ------------------ -}