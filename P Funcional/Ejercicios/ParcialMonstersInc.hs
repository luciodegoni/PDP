energiaDeGrito:: (String, Int, Bool) -> Int
energiaDeGrito (onomatopeya, intensidad, mojolacama) | mojolacama == True = nivelTerror* (intensidad^2) 
                                                     | otherwise = nivelTerror * 3 + intensidad
                                                      where nivelTerror = fromIntegral (length onomatopeya) 

type Grito = (String, Int, Bool)
type Ninio = (String, Int, Int)
nombre:: Ninio -> String
nombre (nombreNinio, _, _) = nombreNinio

edad:: Ninio -> Int
edad (_ , edadNinio, _) = edadNinio

altura:: Ninio -> Int
altura (_, _, alturaNinio) = alturaNinio

gritoMonstruos :: Ninio -> String -> Int
gritoMonstruos ninio monstruo 
     | monstruo == "chuck" = energiaDeGrito (['a'..'z'], 1000, True)
     | monstruo == "osito" = energiaDeGrito ("uf", edad ninio , False)
     | monstruo == "Sullivan" = energiaDeGrito (replicate (length (nombre ninio)) 'a' ++ "AGH", 20 `div` edad ninio, esMenorQue3 ninio)
     | monstruo == "Randall" = energiaDeGrito ("¡Mamadera!", contarVocales (nombre ninio)  , mideEntre ninio)
      
esMenorQue3 :: Ninio -> Bool
esMenorQue3 ninio = edad (ninio) <3 

mideEntre :: Ninio -> Bool
mideEntre ninio = altura ninio < 120 && altura ninio > 80

esVocal :: Char -> Bool
esVocal c = c `elem` "aeiouAEIOU"

contarVocales :: String -> Int
contarVocales = length . filter esVocal

aplicarFuncion :: [a -> b] -> a -> [b]
aplicarFuncion funciones n = map (\f -> f n) funciones


 type Risas = (Int, Int)

 energia :: Risas -> Int
 energia risa = (fst risa) ^ (snd risa)

 
