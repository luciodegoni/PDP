doble x= 2*x
--En la consola podemos utilizar la función map 
--para que nos devuelva el doble de los elementos de una lista
--Para eso no es necesario llamar a la función doble sino que podemos directamente
--usar (3*) [1...6]

losDosPrimeros :: [a] -> [a]
losDosPrimeros = take 2
losDosPrimerosInvertidos lista = (take 2 (reverse lista))
primerosDosInv= (losDosPrimeros).reverse

-- Expresión lamda

-- En vez de hacer map triple [1..20] puedo hacer map (\x -> 3*x) [1..20]

aplicarFunciones :: [(a->b)]-> a -> [b]
aplicarFunciones listaFunciones valor = map (\f -> f valor) listaFunciones

f algo= algo 5

-- any (\algo -> algo 5) [odd, even, (>5)]

--data Perro= UnPerro {
   -- raza:: String
    

