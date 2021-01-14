{- ------------------------------------------- -}
-- DECLARACIÓN y NOMBRE DE LA FUNCIÓN
sumaLista::Num a => [a] -> a
{- PROPÓSITO
Suma todos los elementos de una lista de forma recursiva utilizando
el principio de induccion matematico
1) P(n0)
2) P(n - 1) -> P(n)
    Quitando solo un elemento de la lista
    con la ayuda del operador ":" cabeza:resto

Suma es cierto si devuelve la suma de los elmentos de
la lista que se pasa como primer argumento
-}
-- DEFINICIÓN
sumaLista [] = 0
sumaLista(cabeza:resto) = cabeza + (sumaLista resto)
{- ------------------------------------------- -}
