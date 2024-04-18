data Nomus = UnNomus{
    alas :: Bool,
    brazosMul :: Bool,
    cantOjos :: Int,
    colorPiel :: String,
    fuerza :: Float
}


puedeVer :: Nomus-> Bool
puedeVer nomus= cantOjos nomus >0 


determinarCat :: Nomus -> String
determinarCat fuerza = | fuerza <3000 && fuerza >1000 = "Comun"
                       | fuerza <10000 && fuerza >3000 = "Fuertes"
                       | fuerza >10000 = "High-powered"
                       | otherwise = "pichis"