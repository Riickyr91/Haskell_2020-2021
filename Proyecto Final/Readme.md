# Estudio del código de un solucionador de laberintos programado en Haskell
> Taking code from http://www.rosettacode.org/wiki/Maze_solving

## Introducción.
El proyecto consiste en...
	
	
## Desglose de varias librerías y operadores usados en el código.
 Para poder enteder el funcionamiento del programa, debemos aclarar previamente algunos conceptos.

### '_' - Underscore 
https://typeclasses.com/underscore
>Funciona basicamente en la mayoría de los casos como un caracter para diferenciar funciones.

### Notación infija del operador div  
Usaremos ``10 `div` 2 `` en lugar de ``div 10 2 ``, es decir usaremos notación infija en lugar de prefija para facilitar el entendimiento del código. 

### '$' - Dolar sign
https://typeclasses.com/featured/dollar
    asociatividad de funciones pero con el menor numero de prioridad ( 0 ) , con el espacio tenemos el maximo ( 10 ) 
https://stackoverflow.com/questions/940382/what-is-the-difference-between-dot-and-dollar-sign

###  '!!' - Double exclamantion mark  
Devuelve el elemento situado en la posicíon indicada de un array.
`[1 0 2 3] !! 1` devuelve 0.

### splitAt 
Separa una cadena por el numero del parametro

    Prelude> splitAt 4 [1,2,3,4,5]    
    ([1,2,3,4],[5])  
    Prelude> splitAt 3 [1,2,3,4,5]    
    ([1,2,3],[4,5])

### tail -
Devuelve la misma lista sin el primer elemento

    Prelude> tail [1,2,3,4]
    [2,3,4]
    
### Data.Maybe
Importa un tipo opcional, devuelve el valor que tiene o vacío. https://hackage.haskell.org/package/base-4.14.1.0/docs/Data-Maybe.html
Nothing -> tipo vacio de maybe
Just -> valor posible del Maybe. 
https://stackoverflow.com/questions/18808258/what-does-the-just-syntax-mean-in-haskell/18809252

    data Maybe a = Just a
     | Nothing


### let - in -> 
    https://stackoverflow.com/questions/8274650/in-haskell-when-do-we-use-in-with-let/8274846

### foldl
Recibe una funcion, un elemento y una lista. toma el segundo elemento y el primero de la lista y les aplica la función, luego, con esa salida de la función y el segundo elemento de la lista aplica de nuevo la función y así sucesivamente.
http://zvon.org/other/haskell/Outputprelude/foldl_f.html 

### Filter
Devuelve una lista construida con los elementos de la lista pasada por parametro (el segundo) que cumple la condición booleana del primer parámetro.

    Prelude> filter (>5) [1,2,3,4,5,6,7,8]
    [6,7,8]

### zip
Hace una lista de tuplas, cada tupla contiene un elemento de ambas listas que se dan en la misma posición.

    Prelude> zip [1,2,3] [9,8,7]
    [(1,9), (2,8), (3,7)]

    Prelude> zip [1,2,3,4,5] [9,8]
    [(1,9), (2,8)]

### '/=' - Not equal operator (≠)
 Devuelve true en caso de que los argumentos sean distintos y false en caso de que sean iguales.

### '@' - Signo de arroba.
Tenemos un argumento (Int, Int), en la declaración de la función utilizamos pos@(x,y) y este nos permite acceder a x e y posteriormente.
https://stackoverflow.com/questions/30326249/what-does-mean-in-haskell

### unlines
Crea una cadena a partir de una matriz de cadenas.

	Prelude> unlines ["aa", "bb", "cc", "dd", "ee"]
	"aa\n bb\n cc\n dd\n ee\n"


### lines
Crea una matriz de cadenas a partir de una cadena.

    Prelude> lines "aa\nbb\nbb"
    ["aa", "bb", "bb"]
    
### fromMaybe
utilizado para los valores Maybe, devuelve el valor del Just, sino devuelve None ( en el caso del Nothing).

    Prelude> fromMaybe "" (Just "Hello, World!")
    "¡Hola Mundo!"

    Prelude> fromMaybe "" Nothing
    ""

### interact
utilizado en el main, que no muestra la salida hasta que no tengamos la salida completa.

## Explicación de las funciones própias del código:

### Average
dado dos puntos, devuelve el punto promedio de ellos.
recibe dos puntos -> devuelve un punto
suma de sus posiciones x dividades entre dos , suma de sus posiciones y divididas entre 2. (Devuelve entero, no decimal.)

### noBlocked
dado un laberito, una tupla de posicion ( que no se usa ) y una posicion de muro, devuelve true si la posicion del muro no está bloqueada ( es decir, devuelve true si la posicion del muro no es un muro o false si lo es)
compara ' ' ( espacio sin bloquear ) == a la ( x , y ) del laberito. Saca un array del laberito, es decir saca el array y-esimo ( maze !! y) y luego de ese array saca la poscion x, ( "array y-esimo" !! x)


### substitute
dada una lista, una posición y un elemento, devuelve una lista con el elemento sustituido en la posición pasada por parámetro. (sustituye el elemento de la posición dada por el elemento indicado)
primero separa la lista en dos, before y after donde el punto a substituir es la posicion.
luego concatena before ++ [elemento de a insertar] ++ tail before ( supongamos que la lista es '|   |   ' donde cada celda tiene tres espacios, la posicion elegida para sustituir es la primera, pero nosotros queremos ponerlo en la central, por lo que eliminamos el siguiente a la posicion marcada.) 

### draw 
dado un laberito y una posicion, pinta * en la posicion dada en el laberito.
primero localiza la fila con maze !! y. Primero pinta '*' en la fila row y luego sustituye la fila en maze con la composición $ pero dandole prioridad a la parte derecha.

### tryMoves
Dado un laberinto, una posición previa y una lista de tuplas de nuevas posiciones potenciales con sus posiciones de los muros, devuelve la solución del laverito o nada si este no tiene solución.

    :: [String] -- laberito
    -> (Int, Int) -- posicion previa
    -> [((Int, Int), (Int, Int))] -- posibles posiciones potenciales con sus muros
    -> Maybe [String] -- tipo optional

    Primera declaración es cuando no hay posibles posiciones potenciales, devuleve nothing.
    tryMoves laberinto prevPos ((newPos, wallPos):more) 
        comprueba en case of solve_ del laberinto de la posición anterior a la nueva.
            si el case of devuelve Nothing, prueba con la siguiente posición del array de     potenciales posiciones 
            En el caso de que devuelva Just con el laberito solucionado, devuelve Just de la composicion ( $ ). Pinta * en el laberinto donde este la newPos.

### solve_ 
dado un laberito, una posicion nueva y una posición previa, devuelve el laberinto solucionado o None si no se puede solucionar.
   
    [String] ->  Laberinto 
    (Int, Int) -> newPos
    (Int, Int) -> prevPox 
    Maybe [String] optinonal ( Nothing or Just maze)

primera declaración, cuando estamos en la posicion inicial, devuelve el laberinto tal y como está. columna 2 fila 1, es decir. da igual de donde vengamos ( _ ), que vamos a devolver solución en ese sitio, y tryMoves, pintara el * en la posicion (2,1), es decir la inicial.

En cualquier otro caso, solve_ maze pos@(x, y) prevPos -> primero calcula los laterales de la celda, donde puede haber muros o no, ya que nosotros nos situamos siempre en el centro. Luego, compara que la posición previa no es la misma que la posición nueva, y la filtra, dejando la posicion nueva con alguna o ninguna. Luego calcula el promedio de nuestro pos con cada una de las posibles nuevas posiciones. Esto es para conseguir las posiciones de los muros. Realize una lista de tuplas con cada celda y la posicion de sus muro. Nos quedamos con las posiciones que no tengan muro, es decir que no estén bloqueadas y luego devolvemos tryMoves maze pos y estos movimientos posibles, estos movimientos pueden ser nothig, en este caso al ser un elemento Maybe tanto en este metodo como en tryMoves los tienen controlado. esto lo que realizará es pintar ( o no si no hubiera posibilidad de alguna pos sin muro) esa nueva posición a donde nos dirigimos.

### solve 
Dado un laberinto devuelve el laberinto resuelto o no si este no tiene solución. ( comienza en la esquina inferior derecha y va hasta la esquina superior izquierda ). 
La implmentación consiste en llamar al método solve_ pasandole el mapa con el inicio pintado es decir la situación actual, la posicion actual y la posición previa ( en este caso -1, -1) porque venimos de fuera. donde starx = es la longitud de la columna del laberinto, es decir la ultima columna. y estar y es la ultima fila del laberinto. Le restamos 3 a la x y 2 al y para quedarnos en el centro ya que las celdas no son 1*1 sino 
tres columnas por cada celda y 3 filas por cada celda ( donde la primera fila y la 3 fila son compartidas con las celdas adyacentes)

### main 
Utilizando la entrada por teclado del laberinto, realiza la composición de crear matrices de la cadena, lo resuleve, sino lo resuleve delvuelve can_t solve, en el caso contrario devuelve la matriz de las cadenas resueltas y por ultimo las imprime sin matriz con la función unlines.
 
 --- 
 
📋 Proyecto realizado por **Ricardo Manuel Ruiz Díaz** & **Nicolás Magro Cruzado** para las prácticas de *Programación Funcional* de la [Universidad de Huelva](http://www.uhu.es/etsi/).


