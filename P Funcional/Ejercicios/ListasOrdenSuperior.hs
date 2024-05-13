-- 1 Definir una función que sume una lista de números. 
-- Nota: Investigar sum

sumaDeListas :: [Int] -> Int
sumaDeListas lista = sum lista

-- 2 Durante un entrenamiento físico de una hora, cada 10 minutos de entrenamiento se tomóo la frecuencia cardíaca de uno de los participantes obteniéndose un total de 7 muestras que son las siguientes:
-- frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125] 
-- Comienza con un frecuencia de 80 min 0. 
-- A los 10 min la frecuencia alcanza los 100 
-- A los 20 min la frecuencia es de 120, 
-- A los 30 min la frecuencia es de 128
-- A los 40 min la frecuencia es de 130, …etc.. 
-- A los 60 min la frecuencia es de 125 frecuenciaCardiaca es un función constante. 
--   a. Definir la función promedioFrecuenciaCardiaca, que devuelve el promedio de la frecuencia cardíaca. 
--          Main> promedioFrecuenciaCardiaca 
--          115.285714285714
--   b. Definir la función frecuenciaCardiacaMinuto/1, que recibe m que es el minuto en el cual quiero conocer la frecuencia cardíaca, m puede ser a los 10, 20, 30 ,40,..hasta 60. 
--          Main> frecuenciaCardiacaMomento 30 
--          128 
--          Ayuda: Vale definir una función auxiliar para conocer el número de muestra. 
--   c. Definir la función frecuenciasHastaMomento/1, devuelve el total de frecuencias que se obtuvieron hasta el minuto m. 
--           Main> frecuenciasHastaMomento 30 
--          [80, 100, 120, 128] 
--          Ayuda: Utilizar la función take y la función auxiliar definida en el punto anterior. 

promedioFrecuenciaCardiaca:: [Float] -> Float
promedioFrecuenciaCardiaca lista = (sum lista) / 7

ejFrecuencia :: [Int]
ejFrecuencia = [80, 100, 120, 128, 130, 123, 125]

frecuenciaCardiacaMinuto :: Int -> Int
frecuenciaCardiacaMinuto x = ejFrecuencia !! (div x 10)

frecuenciaCardiacaMomento :: Int -> [Int]
frecuenciaCardiacaMomento momento =  take (div momento 10 + 1) ejFrecuencia

-- 3 Definir la función esCapicua/1, si data una lista de listas, me devuelve si la concatenación de las sublistas es una lista capicua..Ej: 
-- Main> esCapicua ["ne", "uqu", "en"] 
-- True 
-- Porque “neuquen” es capicua.
-- Ayuda: Utilizar concat/1, reverse/1. 

esCapicua :: [String] -> Bool 
esCapicua lista = concat lista == reverse (concat lista)


--  4 Se tiene información detallada de la duración en minutos de las llamadas que se llevaron a cabo en un período determinado, discriminadas en horario normal y horario reducido. 
-- duracionLlamadas = 
-- (("horarioReducido",[20,10,25,15]),(“horarioNormal”,[10,5,8,2,9,10])). 
--      a. Definir la función cuandoHabloMasMinutos, devuelve en que horario se habló más cantidad de minutos, en el de tarifa normal o en el reducido. 
--          Main> cuandoHabloMasMinutos 
--          “horarioReducido” 
--      b. Definir la función cuandoHizoMasLlamadas, devuelve en que franja horaria realizó más cantidad de llamadas, en el de tarifa normal o en el reducido. 
--          Main> cuandoHizoMasLlamadas 
--          “horarioNormal” 
--          Nota: Utilizar composición en ambos casos 

type Llamadas = ((String, [Int]), (String, [Int]))
ejHorarios:: Llamadas
ejHorarios = (("horarioReducido",[20,10,25,15]), ("horarioNormal",[10,5,8,2,9,10]))

cuandoHabloMasMinutos:: Llamadas -> String
cuandoHabloMasMinutos ((reduc, listaR), (normal, listaN)) | sum listaR > sum listaN = reduc
                                                          | otherwise = normal

cuandoHizoMasLlamadas:: Llamadas -> String
cuandoHizoMasLlamadas ((reduc, listaR), (normal, listaN)) | length listaR > length listaN = reduc
                                                          | otherwise = normal


-- 5 Definir la función existsAny/2, que dadas una función booleana y una tupla de tres elementos devuelve True si existe algún elemento de la tupla que haga verdadera la función. 

existsAny :: (a -> Bool) -> (a, a, a) -> Bool
existsAny  f (x, y, z) = any f [x, y, z]

-- 6 Definir la función mejor/3, que recibe dos funciones y un número, y devuelve el resultado de la función que dé un valor más alto. 

mejor :: (Ord a, Num a) => (a -> a) -> (a -> a) -> a -> a
mejor f g x = max (f x) (g x)


-- 7 Definir la función aplicarPar/2, que recibe una función y un par, y devuelve el par que resulta de aplicar la función a los elementos del par

aplicarPar :: (a -> b) -> (a, a) -> (b, b)
aplicarPar f (num1, num2) = (f num1, f num2)

-- 8 Definir la función parDeFns/3, que recibe dos funciones y un valor, y devuelve un par ordenado que es el resultado de aplicar las dos funciones al valor

parDeFns :: (a -> b) -> (a -> c) -> a -> (b, c)
parDeFns f g x = (f x, g x)

-- ORDEN SUPERIOR + LISTAS

-- 1 Definir la función esMultiploDeAlguno/2, que recibe un número y una lista y devuelve True si el número es múltiplo de alguno de los números de la lista.

multiploDe:: Int -> Int -> Bool
multiploDe x y = mod x y == 0

esMultiploDeAlguno:: Int -> [Int] -> Bool
esMultiploDeAlguno num lista = any (multiploDe num) lista

-- 2 Armar una función promedios/1, que dada una lista de listas me devuelve la lista de los promedios de cada lista-elemento.


prom :: [Float] -> Float
prom lista = sum lista / fromIntegral (length lista)

promedios :: [[Float]] -> [Float]
promedios lista = map prom lista

-- 3 Armar una función promediosSinAplazos que dada una lista de listas
--  me devuelve la lista de los promedios de cada lista-elemento, excluyendo los que sean menores a 4 que no se cuentan

promediosSinAplazos:: [[Float]] -> [Float]
promediosSinAplazos lista = filter (>4) (promedios lista)

-- 4 Definir la función mejoresNotas, que dada la información de un curso devuelve la lista con la mejor nota de cada alumno

mejNota:: [Float] -> Float
mejNota lista = maximum lista
mejoresNotas:: [[Float]] -> [Float]
mejoresNotas lista = map (mejNota) lista

-- 5 Definir la función aprobó/1, que dada la lista de las notas de un alumno devuelve True si el alumno aprobó. Se dice que un alumno aprobó si todas sus notas son 6 o más.

aprobo :: [Int] -> Bool
aprobo lista = minimum lista >= 6

-- 6 Definir la función aprobaron/1, que dada la información de un curso devuelve la información de los alumnos que aprobaron

aprobaron :: [[Int]] -> [[Int]]
aprobaron lista = filter (aprobo) lista

-- 7 Definir la función divisores/1, que recibe un número y devuelve la lista de divisores

esDivisor :: Int -> Int -> Bool
esDivisor num div = num `mod` div == 0      
divisores :: Int -> [Int]
divisores n = filter (esDivisor n) [1..n] 

-- 8 Definir la función exists/2, que dadas una función booleana y una lista devuelve True si la función da True para algún elemento de la lista

exists :: (a -> Bool) -> [a] -> Bool
exists f lista = any (f) lista

-- 9 Definir la función hayAlgunNegativo/2, que dada una lista de números y un (…algo…) devuelve True si hay algún nro. negativo. 

hayAlgunNegativo:: [Int] -> a -> Bool
hayAlgunNegativo lista x = any (<0) lista

-- 10 Definir la función aplicarFunciones/2, que dadas una lista de funciones y un valor cualquiera, devuelve la lista del resultado de aplicar las funciones al valor.

aplicarFunciones :: [a -> b] -> a -> [b]
aplicarFunciones funciones valor = map (\f -> f valor) funciones

-- 11 Definir la función sumaF/2, que dadas una lista de funciones y un número, devuelve la suma del resultado de aplicar las funciones al número.

sumaF :: Num b => [a -> b] -> a -> b
sumaF lista num = sum (aplicarFunciones lista num)

-- 12 Un programador Haskell está haciendo las cuentas para un juego de fútbol virtual (como el Hattrick o el ManagerZone). En un momento le llega la información sobre 
-- la habilidad de cada jugador de un equipo, que es un número entre 0 y 12, y la orden de subir la forma de todos los jugadores en un número entero; p.ej., subirle 2 la 
-- forma a cada jugador. Ahora, ningún jugador puede tener más de 12 de habilidad; si un jugador tiene 11 y la orden es subir 2, pasa a 12, no a 13; si estaba en 12 se queda en 12. 
-- Escribir una función subirHabilidad/2 que reciba un número (que se supone positivo sin validar) y una lista de números, y le suba la habilidad a cada jugador cuidando 
-- que ninguno se pase de 12.

subirHabilidad :: Int -> [Int] -> [Int]
subirHabilidad 2 lista = map (sumaMenorQue12 2) lista 

sumaMenorQue12:: Int -> Int -> Int
sumaMenorQue12 num1 num2 | num1 + num2 > 12 = 12
                         | otherwise = num1 + num2

-- 13 Ahora el requerimiento es más genérico: hay que cambiar la habilidad de cada jugador según una función que recibe la vieja habilidad y devuelve la nueva. Armar: una función 
-- flimitada que recibe una función f y un número n, y devuelve f n garantizando que quede entre 0 y 12 (si f n < 0 debe devolver 0, si f n > 12 debe devolver 12)

flimitada :: (Int -> Int) -> Int -> Int
flimitada f n | f (n) > 12 = 12
              | f (n) < 0 = 0
              | otherwise = f (n)


    -- a) Definir una función cambiarHabilidad/2, que reciba una función f y una lista de habilidades, y devuelva el resultado de aplicar f con las garantías de rango que da flimitada

cambiarHabilidad:: (Int -> Int) -> [Int] -> [Int]
cambiarHabilidad f listaH = map (\hab -> flimitada f hab) listaH

    -- b) Usar cambiarHabilidad/2 para llevar a 4 a los que tenían menos de 4, dejando como estaban al resto

ajustarH :: Int -> Int
ajustarH n | n <4 =4
           | otherwise = n

habilidadAjustada :: [Int] -> [Int]
habilidadAjustada listaH = cambiarHabilidad ajustarH listaH

-- 15 Usar takeWhile/2 para definir las siguientes funciones: primerosPares/1, que recibe una lista de números y devuelve la sublista hasta el primer no par exclusive

primerosPares :: [Int] -> [Int]
primerosPares lista = takeWhile even lista

-- primerosDivisores/2, que recibe una lista de números y un número n, y devuelve la sublista hasta el primer número que no es divisor de n exclusive

primerosDivisores:: [Int] -> Int -> [Int]
primerosDivisores lista n = takeWhile (esDivisor n) lista

-- primerosNoDivisores/2, que recibe una lista de números y un número n, y devuelve la sublista hasta el primer número que sí es divisor de n exclusive. 

primerosNoDivisores:: [Int] -> Int -> [Int]
primerosNoDivisores lista n = takeWhile (not.esDivisor n) lista

--  16 Se representa la información sobre ingresos y egresos de una persona en cada mes de un año mediante dos listas, de 12 elementos cada una. P.ej., si entre enero y junio gané 100, 
-- y entre julio y diciembre gané 120, mi lista de ingresos es:
-- [100,100,100,100,100,100,120,120,120,120,120,120] 
-- Si empecé en 100 y fui aumentando de a 20 por mes, llegando a 220, queda:
-- [100,120..220] 
-- Y si es al revés, empecé en 220 y fui bajando de a 20 por mes hasta llegar a 100, queda:
-- [220,200..100] 
-- (jugar un poco con esta notación) 
-- Definir la función: huboMesMejorDe/3, que dadas las listas de ingresos y egresos y un número, devuelve True si el resultado de algún mes es mayor que el número

huboMesMejorDe:: [Int] -> [Int] -> Int -> Bool
huboMesMejorDe ingr egr num = any (>num) (difIngrEgre ingr egr)

difIngrEgre :: [Int] -> [Int] -> [Int]
difIngrEgre ingr egr = map (\t -> fst t - snd t) (zip ingr egr)

--  17 En una población, se estudió que el crecimiento anual de la altura de las personas sigue esta fórmula de acuerdo a la edad:
-- 1 año: 22 cm 
-- 2 años: 20 cm 
-- 3 años: 18 cm 
-- ... así bajando de a 2 cm por año hasta 
-- 9 años: 6 cm 
-- 10 a 15 años: 4 cm 
-- 16 y 17 años: 2 cm 
-- 18 y 19 años: 1 cm 
-- 20 años o más: 0 cm 
-- A partir de esta información: 
--      a) Definir la función crecimientoAnual/1,que recibe como parámetro la edad de la persona, y devuelve cuánto tiene que crecer en un año. Hacerlo con guardas. 
--          La fórmula para 1 a 10 años es 24 - (edad * 2).

crecimientoAnual :: Int -> Int
crecimientoAnual edad | edad > 1 && edad < 10 = 24 - (edad * 2)
        | edad >= 10 && edad < 15 = 4
        | edad >= 15 && edad < 17 = 2
        | edad >= 18 && edad < 19 = 1
        | otherwise = 0



--      b) Definir la función crecimientoEntreEdades/2, que recibe como parámetros dos edades y devuelve cuánto tiene que crecer una persona entre esas dos edades.  
        
crecimientoEntreEdades :: Int -> Int -> Int
crecimientoEntreEdades edad1 edad2 = crecimientoAnual (promEdades edad1 edad2)


promEdades :: Int -> Int -> Int
promEdades edad1 edad2 = (edad1 + edad2) `div` 2

--      c) Armar una función alturasEnUnAnio/2, que dada una edad y una lista de alturas de personas, devuelva la altura de esas personas un año después.

alturasEnUnAnio:: Int -> [Int] -> [Int]
alturasEnUnAnio edad listaA = map(\altura -> altura + crecimientoAnual edad) listaA

--      d) Definir la función alturaEnEdades/3, que recibe la altura y la edad de una persona y una lista de edades, y devuelve la lista de la altura que
--          va a tener esa persona en cada una de las edades. P.ej. 

alturaEnEdades :: Int -> Int -> [Int] -> [Int]
alturaEnEdades altura edadA listaE = map (\e-> crecimientoEntreEdades edadA e + altura) listaE

-- 19 Definir una función que sume una lista de números. Nota: Resolverlo utilizando foldl/foldr. 

sumaLista :: [Int] -> Int
sumaLista lista = foldl1 (+) lista

-- 20 Definir una función que resuelva la productoria de una lista de números. Nota: Resolverlo utilizando foldl/foldr. 

productoLista :: [Int] -> Int
productoLista lista = foldl1 (*) lista

-- 21 Definir la función dispersion, que recibe una lista de números y devuelve la dispersión de los valores, o sea máximo - mínimo. Nota: Probar de utilizar foldr. 

dispersion:: [Int] -> Int
dispersion lista = foldl1 (\t -> max t) lista - foldl1 (\e -> min e) lista