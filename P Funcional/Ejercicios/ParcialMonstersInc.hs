energiaDeGrito:: (String, Int, Bool) -> Int
energiaDeGrito (onomatopeya, intensidad, mojolacama) | mojolacama == True = nivelTerror* (intensidad^2) 
                                                     | otherwise = nivelTerror * 3 + intensidad
                                                      where nivelTerror = fromIntegral (length onomatopeya) 

type Niño = (String, Int, Int)

nombre (nombreNiño, _, _) = nombreNiño
edad (_ , edadNiño, _) = edadNiño
altura (_, _, alturaNiño) = alturaNiño

gritoMonstruos :: Niño -> String -> Int
gritoMonstruos niño monstruo 
    | monstruo == "chuck" = ()
    | 

