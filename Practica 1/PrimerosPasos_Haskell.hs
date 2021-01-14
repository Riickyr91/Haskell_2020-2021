--Esto es un comentario de una linea

{--
    Esto es un comentario multilinea
    {--
        Que contiene otro comentario anidado 
    --}
    Y termina aqui
--}

{--
    Palabras reservadas:
        case
        class
        data
        default
        deriving
        do
        else
        foreign
        if
        import
        in
        infix
        infixl
        infixr
        instance
        let
        module
        newtype
        of
        then
        type
        where
        _ --Subrayado o guión bajo
--}

-- Identificadores empezando por mayusculas se refieren a modulos, clases y construcores
-- Identificadores empezando por minúscula o _ hacen referencia a variables y funciones

{--
    Primer ejemplo de un programa en Haskell
--}

main = putStrLn "Hello World"