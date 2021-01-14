{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
funcionTupla:: Num a => ((a->a->a), a, (a ->a->a)) -> a
{- PROPÓSITO
-}
-- DEFINICIÓN
funcionTupla (f, n, g) = ( f n n) + ( g n n )
{- ------------------------------------------- -}