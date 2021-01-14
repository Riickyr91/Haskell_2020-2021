{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
factorial::Integral a => a->a
-- no funciona aquí, sí en WinHugs
{- PROPÓSITO
-}
-- DEFINICIÓN
factorial n
    | n == 0 = 1
    | n < 0 = error "Valor no valido"
    | n > 0 = n * factorial (n-1)
{- ------------------------------------------- -}