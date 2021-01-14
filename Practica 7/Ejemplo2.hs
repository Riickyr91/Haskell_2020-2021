{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
-- users = [("Saurabh", 35), ("John", 45), ("Trump", 105), ("Biden", 88), ("Doe", -5)]
funcionFilter :: (Eq a1, Ord a2, Show a1, Show a2, Num a2) => [(a1, a2)] -> a2 -> a2 -> Either [Char] [(a1, a2)]
{- PROPÓSITO
-}
-- DEFINICIÓN
funcionFilter users x y =
    if ((filter (\(_, age) -> age < x || age > y) users) == [])
    then Right users
    else Left $ "Multiple users seem to have an incorrect age: " ++ show (filter (\(_, age) -> age < x || age > y) users)
{- ------------------------------------------- -}
