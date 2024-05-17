type Cancion = String

data Artista = UnArtista {
    nombre :: String,
    canciones :: [Cancion]
} deriving Show

fitito :: Artista
fitito = UnArtista "Fitito Paez" ["11 y 6", "El amor despues del amor", "Mariposa Tecknicolor"]

calamardo :: Artista
calamardo = UnArtista "Andres Calamardo" ["Flaca", "Sin Documentos", "Tuyo siempre"]

paty :: Artista
paty = UnArtista "Taylor Paty" ["Shake It Off", "Lover"]


-- 1 Saber la calificacion de un canción, que equivale a la cantidad de letras minúsculas (sin espacios, números ni caracteres especiales) de la canción, más 10.

calificacion :: Cancion -> Int
calificacion cancion = length (filter (\c -> c `elem` ['a'..'z']) cancion) + 10

-- 2 Averiguar si es exitoso un artista, lo que sucede cuando la suma de las calificaciones buenas de las canciones de un artista es mayor a 50 
-- (son buenas las que tienen calificacion mayor a 20)

esExitoso:: Artista -> Bool
esExitoso artista = sum (filter (>20) (map calificacion (canciones artista))) > 50


-- 3 Obtener todos los artistas exitosos, a partir de un conjunto de artistas.

artistasExitosos :: [Artista] -> [Artista]
artistasExitosos = filter esExitoso
