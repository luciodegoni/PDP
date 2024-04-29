--1 Definir la función esMultiploDeTres/1, que devuelve True si un número es múltiplo de 3

esMultiploDeTres :: Int -> Bool
esMultiploDeTres x = mod x 3 == 0 

-- 2 Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod x y == 0

-- 3 Definir la función cubo, devuelve el cubo de un número
cubo :: Int -> Int
cubo x = x*x*x 

-- 4 Definir la función area, devuelve el area de un rectángulo a partir de su base y su altura
area :: Int -> Int -> Int
area b h = b*h

-- 5 Definir la función esBisiesto/1, indica si un año es bisiesto. 
-- (Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100) Nota: Resolverlo reutilizando la función esMultiploDe/2

esBisiesto:: Int -> Bool
esBisiesto anio = (esMultiploDe anio 4) && (not (esMultiploDe anio 100))

--6 Definir la función celsiusToFahr/1, pasa una temperatura en grados Celsius a grados Fahrenheit

celsiusToFahr:: Float -> Float
celsiusToFahr x = (x* 1.8) + 32

--7 Definir la función fahrToCelsius/1, la inversa de la anterior.

fahrToCelsius:: Float -> Integer
fahrToCelsius x = round ((x-32)*0.55) 

--8 Definir la función haceFrioF/1, indica si una temperatura expresada en grados Fahrenheit es fría. Decimos que hace frío si la temperatura es menor a 8 grados Celsius. 
haceFrioF :: Float -> String
haceFrioF x  | (fahrToCelsius x < 8) = "Hace frio"
             | otherwise = "No hace frio"

--9 Definir la función mcm/2 que devuelva el mínimo común múltiplo entre dos números, de acuerdo a esta fórmula.
--m.c.m.(a, b) = {a * b} / {m.c.d.(a, b)}

mcm :: Int -> Int -> Int
mcm x y = (x * y) `div` (gcd x y)

-- 10 Dispersión
-- Trabajamos con tres números que imaginamos como el nivel del río Paraná a la altura de Corrientes medido en tres días consecutivos; cada medición es un entero que representa una cantidad de cm. 
-- P.ej. medí los días 1, 2 y 3, las mediciones son: 322 cm, 283 cm, y 294 cm. 
-- A partir de estos tres números, podemos obtener algunas conclusiones. 
-- Definir estas funciones: 

-- dispersion, que toma los tres valores y devuelve la diferencia entre el más alto y el más bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de dos elementos. De esa forma se puede definir dispersión sin escribir ninguna guarda (las guardas están en max y min, que estamos usando). 

-- diasParejos, diasLocos y diasNormales reciben los valores de los tres días. Se dice que son días parejos si la dispersión es chica, que son días locos si la dispersión es grande, y que son días normales si no son ni parejos ni locos. Una dispersión se considera chica si es de menos de 30 cm, y grande si es de más de un metro. 
-- Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas. 

dispersion :: Int -> Int -> Int -> Int
dispersion x y z = maxThree - minThree
  where
    maxThree = max (max x y) z
    minThree = min (min x y) z

dias:: Int -> Int -> Int -> String
dias x y z | dispersion x y z <30 = "Dia parejo"
           | dispersion x y z >100 = "Dia loco"
           | otherwise = "Dia normal"

-- 11 En una plantación de pinos, de cada árbol se conoce la altura expresada en cm. El peso de un pino se puede calcular a partir de la altura así: 3 kg x cm hasta 3 metros, 2 kg x cm arriba de los 3 metros. P.ej. 2 metros ⇒  600 kg, 5 metros ⇒  1300 kg. 
-- Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino fuera de este rango no le sirve a la fábrica. Para esta situación: 
-- Definir la función pesoPino, recibe la altura de un pino y devuelve su peso. 
-- Definir la función esPesoUtil, recibe un peso en kg y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. 
-- Definir la función sirvePino, recibe la altura de un pino y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. Usar composición en la definición. 
primerosTres :: Int -> Int
primerosTres x = x*3
metrosRestantes :: Int -> Int
metrosRestantes x = max 0 (x-300)
pesoPino:: Int -> Int
pesoPino x | x>300 = primerosTres 300 + metrosRestantes x * 2
           | otherwise =  primerosTres x

esPesoUtil :: Int -> Bool
esPesoUtil x = x>=400 && x<=1000 

sirvePino :: Int -> Bool
sirvePino = esPesoUtil . pesoPino






             