{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
factorial::Integral a => a->a
-- no funciona aquí, sí en WinHugs
{- PROPÓSITO
-}
-- DEFINICIÓN
factorial 0 = 1
factorial m@(n+1) = m * factorial n
{- ------------------------------------------- -}