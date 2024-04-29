
totalCaracteres lista= sum (map length lista)
lista :: [[Char]]
lista= ["Hola", "que", "tal"]

trescaracteres lista= length lista > 3
palabrasMas3 lista = length (filter trescaracteres lista)

doble :: Int -> Int
doble x= 2*x
cuadrado :: Int -> Int
cuadrado x= x*x
cuadradodoble :: Int -> Int
cuadradodoble= doble.cuadrado

listaej :: [Int]
listaej = [1, 2, 3, 6]
dobleCuadradoLista :: [Int] -> [Int]
dobleCuadradoLista listaej = map cuadradodoble listaej

listaCuadradoEsPar listaej= map (even.cuadrado) listaej

