
----------DEFINICIONES DE DATOS----------
data Auto = UnAuto {
    color :: String,
    velocidad :: Int,
    distancia :: Int
} deriving (Show, Eq)

type Color = String
type Carrera = [Auto]
type Tiempo = Int
type Modificador = (Int -> Int)
type PowerUp = (Auto -> Carrera -> Carrera)
-- 1 Declarar los tipos Auto y Carrera como consideres convenientes para representar la información indicada y definir funciones para resolver los siguientes problemas:

----------EJEMPLOS DE PRUEBA----------
ejLuigi :: Auto
ejLuigi = UnAuto "verde" 80 70

ejWario :: Auto
ejWario = UnAuto "amarillo" 60 50

ejRayoMcQueen :: Auto
ejRayoMcQueen = UnAuto "rojo" 200 100

ejMate :: Auto
ejMate = UnAuto "marron" 120 90
--------------------------------------

-- a. Saber si un auto está cerca de otro auto, que se cumple si son autos distintos y la distancia que hay entre ellos (en valor absoluto) es menor a 10.

estaCerca:: Auto -> Auto -> Bool
estaCerca auto1 auto2 = color auto1 /= color auto2 && (distancia auto1 - distancia auto2) <= 10 

-- b. Saber si un auto va tranquilo en una carrera, que se cumple si no tiene ningún auto cerca y les va ganando a todos (por haber recorrido más distancia que los otros).

vaTranquilo :: Auto -> Carrera -> Bool
vaTranquilo auto carrera = all (not. estaCerca auto ) carrera && all (\c -> distancia auto > distancia c) carrera

-- c. Conocer en qué puesto está un auto en una carrera, que es 1 + la cantidad de autos de la carrera que le van ganando.

puestoCarrera :: Auto -> Carrera -> Int
puestoCarrera auto carrera = (length carrera) - (length.  (filter (not. leGana auto))) carrera + 1

leGana:: Auto -> Auto -> Bool
leGana auto1 auto2 = distancia auto1 > distancia auto2

-- 2 Desarrollar las funciones necesarias para manipular el estado de los autos para que sea posible:

-- a. Hacer que un auto corra durante un determinado tiempo. Luego de correr la cantidad de tiempo indicada, la distancia recorrida por el auto debería ser equivalente a la distancia 
-- que llevaba recorrida + ese tiempo * la velocidad a la que estaba yendo.

tiempoCorrido:: Tiempo -> Auto-> Auto
tiempoCorrido tiempo auto = auto {distancia = distancia auto + tiempo * velocidad auto}

-- b
    -- i. A partir de un modificador de tipo Int -> Int, queremos poder 
    -- alterar la velocidad de un auto de modo que su velocidad final sea la resultante de usar dicho modificador con su velocidad actual.

cambiarVelocidad :: Modificador -> Auto -> Auto
cambiarVelocidad modificador auto = auto { velocidad = max 0 (modificador (velocidad auto))}
    -- ii. Usar la función del punto anterior para bajar la velocidad de un auto en una cantidad indicada de modo que se le reste a la velocidad actual la cantidad indicada,
    -- y como mínimo quede en 0, ya que no es válido que un auto quede con velocidad negativa.

bajarNVelocidad :: Int -> Auto -> Auto
bajarNVelocidad num auto = cambiarVelocidad (flip (-) num) auto

-- 3 Como se explicó inicialmente sobre las carreras que queremos simular, los autos que participan pueden gatillar poderes especiales a los que denominamos power ups.
--Estos poderes son variados y tienen como objetivo impactar al estado general de la carrera, ya sea afectando al auto que lo gatilló y/o a sus contrincantes dependiendo
-- de qué poder se trate.
-- terremoto: luego de usar este poder, los autos que están cerca del que gatilló el power up bajan su velocidad en 50.
-- miguelitos: este poder debe permitir configurarse con una cantidad que indica en cuánto deberán bajar la velocidad los autos que se vean afectados por su uso. Los autos a afectar son aquellos a los cuales el auto que gatilló el power up les vaya ganando.
-- jet pack: este poder debe afectar, dentro de la carrera, solamente al auto que gatilló el poder. El jet pack tiene un impacto que dura una cantidad limitada de tiempo, el cual se espera poder configurar.
-- Cuando se activa el poder del jet pack, el auto afectado duplica su velocidad actual, luego corre durante el tiempo indicado y finalmente su velocidad vuelve al valor que tenía antes de que se active el poder.
-- Por simplicidad, no se espera que los demás autos que participan de la carrera también avancen en ese tiempo.

afectarALosQueCumplen :: (a -> Bool) -> (a -> a) -> [a] -> [a]
afectarALosQueCumplen criterio efecto lista
  = (map efecto . filter criterio) lista ++ filter (not.criterio) lista

terremoto :: PowerUp
terremoto auto carrera = afectarALosQueCumplen (estaCerca auto) (bajarNVelocidad 50) carrera

miguelitos :: Int -> PowerUp
miguelitos num auto carrera = afectarALosQueCumplen (leGana auto) (bajarNVelocidad num) carrera

jetPack :: Int -> PowerUp
jetPack tiempo auto carrera = afectarALosQueCumplen (==auto) (cambiosJetPack tiempo) carrera

cambiosJetPack :: Int -> Auto -> Auto
cambiosJetPack tiempo auto = auto {distancia = distancia (tiempoCorrido tiempo (cambiarVelocidad (*2) auto))}

-- Simular carrera y obtener posiciones faltan

aplicarListaEventos :: Carrera -> [(Carrera -> Carrera)] -> Carrera
aplicarListaEventos carrera [] = carrera
aplicarListaEventos carrera (x:xs) = aplicarListaEventos (x carrera) xs

correnTodos :: Int -> Carrera -> Carrera
correnTodos num carrera = map (tiempoCorrido num ) carrera

usaPowerUp :: String -> PowerUp -> Carrera -> Carrera
usaPowerUp colorBuscado powerup carrera = powerup (obtenerAutoPorColor colorBuscado carrera) carrera

obtenerAutoPorColor :: String -> Carrera -> Auto
obtenerAutoPorColor colorBuscado = head . (filter ((== colorBuscado). color))

-- 5 Responder:
-- Si se quisiera agregar un nuevo power up, un misil teledirigido, que para poder activarlo se deba indicar el
-- color del auto al que se quiere impactar, ¿la solución actual lo permite o sería necesario cambiar algo de lo desarrollado en los puntos anteriores? Justificar.
-- La solución actual permitiría hacerlo ya que trabajamos utilizando la función colorbuscado podemos acceder al color del auto de una carrera.

-- No sería posible ya que ambas funciones te piden comparar los autos