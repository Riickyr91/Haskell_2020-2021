{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
funcionTupla :: (t -> t -> Bool, t, t -> t -> Bool) -> Bool
{- PROPÓSITO
-}
-- DEFINICIÓN
funcionTupla (f, n, g) = ( f n n) && ( g n n )
{- ------------------------------------------- -}