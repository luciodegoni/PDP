import Text.Show.Functions
data Guantelete = UnGuantelete {
    material :: String,
    gemas :: [Gema]
} deriving (Show)

data Personaje = UnPersonaje {
    nombre :: String,   
    edad :: Int,
    energia :: Int,
    habilidades :: [String], 
    planeta :: String
} deriving (Show, Eq)

type Universo = [Personaje]
type Gema = Personaje -> Personaje
type Enemigo = Personaje

ironMan :: Personaje
ironMan = UnPersonaje "Tony Stark" 45 300 ["Volar","Rayo láser"] "Tierra"

capitanAmerica :: Personaje
capitanAmerica = UnPersonaje "Steve Rogers" 200 200 ["Resitencia","Arrojar Escudo"] "Tierra"

drStrange :: Personaje
drStrange = UnPersonaje "Dr Extraño" 50 800 ["Volar","Telequinesis"] "Tierra"

universo1 :: Universo
universo1 = [ironMan, capitanAmerica, drStrange, groot, wolverine]

groot :: Personaje
groot = UnPersonaje "Groot" 30 200 ["hablar", "golpear"] "Tierra"

wolverine :: Personaje
wolverine = UnPersonaje "Logan" 100 80 ["regeneracion", "sentidos aumentados"] "Tierra"

-- Punto 1: (2 puntos) Modelar Personaje, Guantelete y Universo como tipos de dato e implementar el chasquido de un universo.

chasquear:: Universo -> Guantelete -> Universo
chasquear universo guantelete
    | length (gemas guantelete) == 6 && material guantelete == "uru" = take (length universo `div` 2) universo 


-- Punto 2: (3 puntos) Resolver utilizando únicamente orden superior.
-- Saber si un universo es apto para péndex, que ocurre si alguno de los personajes que lo integran tienen menos de 45 años.
-- Saber la energía total de un universo que es la sumatoria de todas las energías de sus integrantes que tienen más de una habilidad.

aptoPendex :: Universo -> Bool
aptoPendex = any ((<=45).edad) 

energiaTotal :: Universo -> Int
energiaTotal universo = sum (map energia (filter ((> 1) . length . habilidades) universo))

-- Punto 3: (3 puntos) Implementar las gemas del infinito, evitando lógica duplicada. 

gemaMente :: Int -> Gema
gemaMente cantEnergia personaje = personaje {energia = energia personaje - cantEnergia}

gemaAlma :: String -> Gema
gemaAlma habilidadAEliminar personaje = personaje {
    habilidades = filter (/= habilidadAEliminar) (habilidades personaje),
    energia = energia personaje -10 
    }

gemaEspacio :: String -> Gema
gemaEspacio planetaX personaje = personaje {planeta = planetaX , energia = energia personaje -20}

gemaPoder :: Gema
gemaPoder personaje = quitarHabilidad personaje {energia = 0}


quitarHabilidad :: Personaje -> Personaje
quitarHabilidad personaje | length (habilidades personaje) == 2 = personaje {habilidades = []} 
                          | otherwise =  personaje {habilidades = habilidades personaje}

gemaTiempo :: Gema
gemaTiempo personaje = modificarEdad personaje {energia = energia personaje -50}

gemaLoca :: Gema -> Gema
gemaLoca gema = gema . gema

modificarEdad :: Personaje -> Personaje
modificarEdad personaje | edad personaje `div` 2 < 18 = personaje {edad = 18}
                        | otherwise = personaje {edad= edad personaje `div` 2}

-- Punto 4: (1 punto) Dar un ejemplo de un guantelete de goma con las gemas tiempo, alma que quita la habilidad de “usar Mjolnir” y la gema loca que manipula
-- el poder del alma tratando de eliminar la “programación en Haskell”.

ejGuantelete :: Guantelete
ejGuantelete = UnGuantelete "goma" [gemaTiempo, gemaAlma "usar Mjolnir", gemaLoca (gemaAlma "programación en Haskell")]

-- Punto 5: (2 puntos). No se puede utilizar recursividad. Generar la función utilizar  que dado una lista de gemas y un enemigo ejecuta el poder de cada una de las gemas
-- que lo componen contra el personaje dado. Indicar cómo se produce el “efecto de lado” sobre la víctima.

utilizar :: [Gema] -> Enemigo -> Enemigo
utilizar gemas enemigo = foldr ($) enemigo gemas 






































