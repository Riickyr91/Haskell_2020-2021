{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
quitaBlancosPrinc::String->String
-- equivalente a quitaBlancosPrinc::[Char]->[Char]

{- PROPÓSITO
-}
-- DEFINICIÓN
quitaBlancosPrinc (cab:resto)
    | cab == ' ' = quitaBlancosPrinc resto
    | otherwise = (cab:resto)
{- ------------------------------------------- -}