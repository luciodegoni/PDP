data Personaje = UnPersonaje {
    nombre :: String,
    cantDinero :: Int,
    nivelFelicidad :: Int
} deriving Show

cartman :: Personaje
cartman = UnPersonaje "Cartman" 300 100
stan :: Personaje
stan = UnPersonaje "Stan" 150 200
butters :: Personaje
butters = UnPersonaje "Butters" 250 150


irALaEscuela :: Personaje -> Personaje
irALaEscuela personaje 
    | nombre personaje == "Butters" = personaje {nivelFelicidad= nivelFelicidad personaje + 20}
    | nivelFelicidad personaje >= 20 = personaje { nivelFelicidad = nivelFelicidad personaje - 20 }
    | otherwise                      = personaje { nivelFelicidad = 0 }

comerCheesyPoof :: Personaje -> Int -> Personaje
comerCheesyPoof personaje cantCheesy = personaje { 
    nivelFelicidad = nivelFelicidad personaje + 10 * cantCheesy, 
    cantDinero = cantDinero personaje - 10 * cantCheesy 
}

irATrabajar :: Personaje -> [[Char]] -> Personaje
irATrabajar personaje trabajos = personaje {cantDinero = cantDinero personaje + sum (map length trabajos)}

hacerDobleTurno :: Personaje -> [[Char]] -> Personaje
hacerDobleTurno personaje trabajos
    | nivelFelicidad personaje > sum (map length trabajos) = personaje { 
        cantDinero = cantDinero personaje + 2 * sum (map length trabajos),
        nivelFelicidad = nivelFelicidad personaje - sum (map length trabajos)
    }
    | otherwise = personaje {
        cantDinero = cantDinero personaje + 2 * sum (map length trabajos),
        nivelFelicidad = 0
    }
jugarWOW :: Personaje -> Int -> Int -> Personaje
jugarWOW personaje cantAmigos cantHoras
    | cantHoras <= 5 = personaje { 
        cantDinero = cantDinero personaje - 10 * cantHoras,
        nivelFelicidad = nivelFelicidad personaje + 10 * cantAmigos 
    }
    | otherwise = personaje {
        cantDinero = cantDinero personaje - 10 * cantHoras,
        nivelFelicidad = nivelFelicidad personaje + (10 * cantAmigos)* 5
    }

aplicarNVeces :: (Personaje -> Personaje) -> Int -> Personaje -> Personaje
aplicarNVeces accion n personaje = foldl (\p _-> accion p) personaje [1..n]


listaActividades :: Personaje -> [Personaje -> Personaje] -> Personaje
listaActividades personaje actividades = foldl (\acc f -> f acc) personaje actividades
