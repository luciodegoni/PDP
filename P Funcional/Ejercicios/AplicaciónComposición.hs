--1 Definir una función siguiente, que al invocarla con un número cualquiera me devuelve el resultado de sumar a ese número el 1. 
siguiente:: Int -> Int
siguiente= (+ 1)

--2 Definir la función mitad que al invocarla con un número cualquiera me devuelve la mitad de dicho número

mitad:: Float -> Float
mitad= (/2)

--3 Definir una función inversa, que invocando a la función con un número cualquiera me devuelva su inversa. 
inversa:: Float -> Float
inversa= (1/)

--4 Definir una función triple, que invocando a la función con un número cualquiera me devuelva el triple del mismo.
triple:: Int -> Int
triple= (*3)

--5 Definir una función esNumeroPositivo, que invocando a la función con un número cualquiera me devuelva true si el número es positivo y false en caso contrario. 
esNumeroPositivo:: Int -> Bool
esNumeroPositivo = (>0)

--6 Resolver la función del ejercicio 2 de la guía anterior esMultiploDe/2, utilizando aplicación parcial y composición.
esMultiploDe:: Int -> Int -> Bool
esMultiploDe=((==0) .) . mod

--7 Resolver la función del ejercicio 5 de la guía anterior esBisiesto/1, utilizando aplicación parcial y composición

-- esBisiesto :: Int -> Bool
-- esBisiesto = 