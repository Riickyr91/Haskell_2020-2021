{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
suma3::Int->Int->Int->Int
{- PROPÓSITO
-}
-- DEFINICIÓN
suma3 x y z = x + y + z
{- ------------------------------------------- -}

{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
{- PROPÓSITO
-}
-- DEFINICIÓN
funcSolMap [] _ = []
funcSolMap (f:fs) (x:xs) = f x : (funcSolMap fs xs)
{- ------------------------------------------- -}

{- 
map (suma3 2) [1,2,3]
Devuelve una lista de funciones de dos argumentos de entrada y uno de salida.
La funcion suma 2 a los otros dos argumentos de entrada
[(+3),(+4),(+5)]
-}