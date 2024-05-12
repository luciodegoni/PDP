import System.Win32 (COORD(yPos), aCCESS_SYSTEM_SECURITY, xBUTTON1)
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

listaAnterior:: Integer -> [Integer]
listaAnterior 0 = []
listaAnterior n = n : listaAnterior (n-1)

listaInfinita:: Integer -> [Integer]
listaInfinita n = n : listaInfinita (n+1)

g:: Float -> Float -> Float
g 0 x = 0
g y 0 = y
g y x = x + y 

ultimo :: [a] -> a
ultimo [x] = x
ultimo (cabeza: cola) = ultimo cola

data Persona = UnaPersona {
    cansancio :: Float, 
    nombre :: String
} deriving Show
-- trabajar :: Float -> Persona -> Persona
-- trabajar trabajo alguien = alguien {cansancio = cansancio alguien +}

tabla n i = n*i : tabla n (i+1)

-- calculadoraNrOperaciones = foldrl (.) operaciones nro
