{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
map2 :: (a -> b) -> [a] -> [b]
-- no funciona aquí, sí en WinHugs
{- PROPÓSITO
-}
-- DEFINICIÓN
map2 _ [] = []
map2 f (cab:resto) = f cab : map2 f resto
{- ------------------------------------------- -}