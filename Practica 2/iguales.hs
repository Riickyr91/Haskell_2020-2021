{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
iguales::Eq a=>a->a->a->Bool
{- PROPÓSITO
Devuelve True si x es >= 0, False en otro caso
-}
-- DEFINICIÓN
iguales x y z = x == y && y == z
{- ------------------------------------------- -}
