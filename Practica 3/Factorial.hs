{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
-- factorial::Int->Int con entero corto
factorial::Integer->Integer
{- PROPÓSITO
-}
-- DEFINICIÓN
factorial 0 = 1
factorial n = n * factorial (n-1)
{- ------------------------------------------- -}

{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
factorial2::(Num a, Ord a) => a -> a
{- PROPÓSITO
-}
-- DEFINICIÓN
factorial2 n
    | n == 0 = 1
    | n > 0 = n * factorial2 (n - 1)
    | otherwise = error "Valor negativo"
{- ------------------------------------------- -}

{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
factorial3:: (Eq p, Num p) => p -> p
{- PROPÓSITO
-}
-- DEFINICIÓN
factorial3 n = if (n == 0) then 1 else n * factorial3 ( n - 1 )
{- ------------------------------------------- -}