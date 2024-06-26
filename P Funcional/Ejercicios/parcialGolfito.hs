data Jugador = UnJugador {
  nombre :: String,
  padre :: String,
  habilidad :: Habilidad
} deriving (Eq, Show)

data Habilidad = UnaHabilidad {
  fuerzaJugador :: Int,
  precisionJugador :: Int
} deriving (Eq, Show)

-- Jugadores de ejemplo
bart = UnJugador "Bart" "Homero" (UnaHabilidad 25 60)
todd = UnJugador "Todd" "Ned" (UnaHabilidad 15 80)
rafa = UnJugador "Rafa" "Gorgory" (UnaHabilidad 10 1)

data Tiro = UnTiro {
  velocidad :: Int,
  precision :: Int,
  altura :: Int
} deriving (Eq, Show)

type Puntos = Int

type Palo = Habilidad -> Tiro

putter :: Palo
putter habilidad = UnTiro { velocidad = 10, precision = (precisionJugador habilidad) * 2, altura = 0}

madera :: Palo
madera habilidad = UnTiro { velocidad = 100, precision = (precisionJugador habilidad) `div` 2, altura = 5}

hierros :: Int -> Palo
hierros n habilidad = UnTiro {velocidad = fuerzaJugador habilidad * n, precision = (precisionJugador habilidad `div` n), altura = n - 3}

palos :: [Palo]
palos = [putter, madera] ++ map hierros [1..10]

golpe :: Jugador -> Palo -> Tiro
golpe jugador palo = palo (habilidad jugador)

tiroDetenido :: Tiro
tiroDetenido = UnTiro 0 0 0

data Obstaculo = UnObstaculo {
    tiroPostObstaculo :: Tiro -> Tiro,
    superaObstaculo :: Tiro -> Bool
}

type PostObstaculo = Tiro -> Tiro
type SuperaObstaculo = Tiro -> Bool

-- Definición de obstáculo rampita
rampita :: PostObstaculo
rampita tiro
    | superaRampita tiro = tiro { velocidad = velocidad tiro * 2, precision = 100, altura = 0}
    | otherwise = tiroDetenido

superaRampita :: SuperaObstaculo
superaRampita tiro = (precision tiro > 90 && altura tiro == 0)

ejRampita = UnObstaculo rampita superaRampita 

-- Definición de obstáculo laguna
laguna :: Int -> PostObstaculo
laguna largoLaguna tiro
    | superaLaguna tiro = tiro {velocidad = velocidad tiro, precision = precision tiro, altura = altura tiro `div` largoLaguna}
    | otherwise = tiroDetenido

superaLaguna :: SuperaObstaculo
superaLaguna tiro = (velocidad tiro > 80 && altura tiro >= 1 && altura tiro <= 5)

ejLaguna = UnObstaculo (laguna 3) superaLaguna  -- Ejemplo de laguna con longitud 3

-- Definición de obstáculo hoyo
hoyo :: PostObstaculo
hoyo _ = tiroDetenido

superaHoyo :: SuperaObstaculo
superaHoyo tiro = velocidad tiro >= 5 && velocidad tiro <= 20 && precision tiro >= 95 && altura tiro == 0

ejHoyo = UnObstaculo hoyo superaHoyo

palosUtiles :: Jugador -> Obstaculo -> [Palo]
pa