{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
funcionLista :: Show a => [a] -> [Char]
{- PROPÓSITO
-}
-- DEFINICIÓN
funcionLista lista =
    case lista of 
        [] -> "(none)"
        [a] -> show a
        [a, b] -> show a ++ " and " ++ show b
        [a, b, c] -> show a ++ ", " ++ show b ++ ", and " ++ show c
        (a:b:c) -> show a ++ ", " ++ show b ++ ", and (" ++ (show $ length c) ++ ") more"
{- ------------------------------------------- -}
