{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
quitaBlancosPrinc::String->String
-- equivalente a quitaBlancosPrinc::[Char]->[Char]

{- PROPÓSITO
-}
-- DEFINICIÓN
quitaBlancosPrinc cadena@(cab:resto)
    | cab == ' ' = quitaBlancosPrinc resto
    | otherwise = cadena
{- ------------------------------------------- -}
