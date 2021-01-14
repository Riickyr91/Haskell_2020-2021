{- ------------------ -}
-- Declaracion
losTresIguales::Int->Int->Int->Bool
{- Proposito
-}
-- Definicion
losTresIguales x y z = x == y && y == z
{- ------------------ -}

{- ------------------ -}
-- Declaracion
losCuatroIguales::Int->Int->Int->Int->Bool
{- Proposito
-}
-- Definicion
losCuatroIguales w x y z = w == x && x == y && y == z
{- ------------------ -}

{- ------------------ -}
-- Declaracion
losCuatroIguales2::Int->Int->Int->Int->Bool
{- Proposito
-}
-- Definicion
losCuatroIguales2 w x y z = (losTresIguales w x y) && (losTresIguales x y z)
{- ------------------ -}