{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
miFuncion2::[(a->b)] -> [a] -> [[b]]
{- PROPÓSITO
miFuncion2 es cierto si devuelve una lista de listas resultado
de aplicar las funciones del primer argumento a todos
los valores de la lista de valores del segundo argumento
Ejemplo :
    miFuncion2 [(+1) , (+2), (+3) [1,2,3] ->
        [[2,3,4] , [3,4,5] , [4,5,6]]
-}
-- DEFINICIÓN
miFuncion2 [] _ = []  
miFuncion2 (f:fs) lista = (map f lista):(miFuncion2 fs lista) 
{- ------------------------------------------- -}

{- Resolución Nico
miFunc2 :: [(a->b)] -> [a] -> [[b]]
miFunc2 [] _ = []
miFunc2 (f:fs) x = miFunc2a f x : miFunc2 fs x


miFunc2a :: (a->b) -> [a] -> [b]
miFunc2a _ [] = []
miFunc2a f (x:xs) = f x : miFunc2a f xs
-}