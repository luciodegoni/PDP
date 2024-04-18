import Data.String (IsString)
triple x = x * 3

f 1 = 3
f 3 = 5

cuadrado:: Float -> Float
cuadado 1=1
cuadrado 2=4
cuadrado x= x*x

esCero:: Int-> Bool
esCero 0=  True
esCero 3= False
esCero 5= False

funcion x= cuadrado x + triple x

inicial:: String -> Char
inicial = head

superficie:: Float -> Float
superficie x= pi * x* x


doble:: Int -> Int
doble x= x*2

factorial:: Int -> Int
factorial 0= 1
factorial n= n * factorial (n-1)

suma:: Int -> Int -> Int -> Int
suma x y z= x+y+z

--esBisiesto:: Int -> Bool
--esBisiesto anio= (esDivisible anio 4) && (not(esDivisibles anio 400))

primerosTresMetros:: Int -> Int
primerosTresMetros= min 3

metrosRestantes :: Int -> Int
metrosRestantes altura= max 0 (altura-3)

pesoPino:: Int -> Int
pesoPino altura = primerosTresMetros altura *300 + metrosRestantes altura *200
