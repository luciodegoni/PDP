type Material = String
data Personaje = UnPersonaje {
    nombre:: String,
    puntaje:: Int,
    inventario:: [Material]
} deriving Show

data Receta = UnaReceta {
    materiales:: [Material],
    tiempo :: Int,
    resultado :: Material
} deriving Show


steve :: Personaje
steve = UnPersonaje "Steve" 1000 ["madera", "fosforo", "lana", "agujas", "tintura", "pollo"]

tomi :: Personaje
tomi = UnPersonaje "Tomi" 500 ["madera", "madera", "fosforo", "fosforo", "pollo", "fogata", "lana", "agujas", "tintura"]


ejFogata :: Receta
ejFogata = UnaReceta ["madera", "fosforo"] 10 "fogata"
ejPolloAsado :: Receta
ejPolloAsado = UnaReceta ["pollo", "fogata"] 300 "pollo asado"
ejSueter = UnaReceta ["lana", "agujas", "tintura"] 600 "sueter"

craftear :: Receta -> Personaje -> Personaje
craftear receta personaje
    | tieneMateriales receta personaje = cambiarPuntos (tiempo receta * 10) . agregarObjeto (resultado receta) . quitarMateriales (materiales receta) $ personaje
    | otherwise = personaje { puntaje = puntaje personaje - 100 }

tieneMaterial :: Personaje -> Material -> Bool
tieneMaterial personaje material = elem material (inventario personaje)

tieneMateriales :: Receta -> Personaje -> Bool
tieneMateriales receta personaje = all (tieneMaterial personaje) (materiales receta)

agregarObjeto :: Material -> Personaje -> Personaje
agregarObjeto material personaje = personaje {inventario = material:inventario personaje}

quitarMateriales :: [Material] -> Personaje -> Personaje
quitarMateriales materiales personaje = personaje {inventario = foldr quitarUnaVez (inventario personaje) materiales}

quitarUnaVez :: Eq a => a -> [a] -> [a]
quitarUnaVez _ [] = []
quitarUnaVez material (m:ms)  
    | material == m = ms
    | otherwise = m : quitarUnaVez material ms 

cambiarPuntos :: Int -> Personaje -> Personaje
cambiarPuntos n personaje = personaje {puntaje = puntaje personaje + n}

craftearSucesivamente :: Personaje -> [Receta] -> Personaje
craftearSucesivamente = foldr craftear

masPuntos :: Personaje -> [Receta] -> Bool
masPuntos personaje listaDeRecetas = puntaje (craftearSucesivamente personaje (reverse listaDeRecetas)) > puntaje (craftearSucesivamente personaje listaDeRecetas)

duplicaSusPuntos :: Personaje -> Receta -> Bool
duplicaSusPuntos personaje receta = puntaje (craftear receta personaje) > 2* puntaje personaje

objetosQueDuplican :: [Receta] -> Personaje -> [Receta]
objetosQueDuplican listaDeRecetas personaje = filter (duplicaSusPuntos personaje) listaDeRecetas

data Bioma = UnBioma {
    materialesDelBioma :: [Material],
    materialNecesario :: Material
}

artico :: Bioma
artico = UnBioma ["hielo", "iglues", "lobos"] "sueter"

type Herramienta = [Material] -> Material

hacha :: Herramienta 
hacha = last

espada :: Herramienta
espada = head

-- pico ??

minar :: Herramienta -> Bioma -> Personaje -> Personaje
minar herramienta bioma personaje 
    | tieneMaterial personaje (materialNecesario bioma) = agregarObjeto (herramienta (materialesDelBioma bioma)) (cambiarPuntos 50 personaje)
    | otherwise = personaje
