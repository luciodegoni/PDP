data Nomus = UnNomus{
    alas :: Bool,
    brazosMul :: Bool,
    cantOjos :: Int,
    colorPiel :: String,
    fuerza :: Float
}
nomu1= UnNomus True True 3 "Oscuro" 40

--puedeVer :: Nomus-> Bool
--puedeVer nomu = | (cantOjos nomu) >0 = True
  --              | (cantOjos nomu)==0 = False


--determinarCat :: Nomus -> String
--determinarCat fuerza = | fuerza <3000 && fuerza >1000 = "Comun"
  --                     | fuerza <10000 && fuerza >3000 = "Fuertes"
    --                   | fuerza >10000 = "High-powered"
      --                 | otherwise = "pichis"

entrenar :: Int -> Nomus
entrenar tiempo nomu= UnNomus {
    ojos= ojos nomu,
    alas= alas nomu,
    fuerza= fuerza nomu + tiempo,
    brazos= True
}