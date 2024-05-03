import Distribution.Compat.Process (enableProcessJobs)
data Nave = UnaNave {
    nombre :: String,
    durabilidad :: Int,
    escudo :: Int, 
    ataque :: Int,
    poder :: [Nave -> Nave]
}

pTurbo :: Nave -> Nave
pTurbo nave = nave {ataque = ataque nave +25}

pReparacion :: Nave -> Nave
pReparacion nave = nave {durabilidad = durabilidad nave +50, ataque= ataque nave -20}

pSuperTurbo :: Nave -> Nave
pSuperTurbo nave = (pTurbo.pTurbo.pTurbo) (nave {durabilidad = durabilidad nave -45})

pEscudo :: Nave -> Nave
pEscudo nave = nave {escudo = escudo nave +100}

pSuperAtaque :: Nave -> Nave
pSuperAtaque nave = nave {ataque = ataque nave +100, durabilidad = durabilidad nave -50}
 
ejTieFighter = UnaNave "Tie Fighter" 200 100 50 [pTurbo]
ejXWing ::Nave
ejXWing = UnaNave "X Wing" 300 150 100 [pReparacion]
ejNaveDarthVader = UnaNave "Nave de Darth Vader" 500 300 200 [pSuperTurbo]
ejMilleniumFalcon = UnaNave "Millenium Falcon" 1000 500 50 [pReparacion, pEscudo]

ejCazaN1 = UnaNave "Caza N1" 400 200 200 [pSuperAtaque]

flota:: [Nave]
flota = [ejXWing, ejMilleniumFalcon]

durabilidadFlota:: 

