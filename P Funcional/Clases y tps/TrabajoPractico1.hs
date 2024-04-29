funcionSueldo :: String -> Float -> Float -> Float
funcionSueldo x y z = sueldoBasico x * porcentajeIncremento y * fromIntegral (horasTotales z)

sueldoBasico :: String -> Float
sueldoBasico x | x == "titular" = 149000
               | x == "adjunto" = 116000
               | x == "ayudante" = 66000
               | otherwise = 0


porcentajeIncremento :: Float -> Float
porcentajeIncremento x | x >= 24   = 2.2
                       | x >= 10   = 1.5
                       | x >= 5    = 1.3
                       | x >= 3    = 1.2
                       | otherwise = 1


horasTotales :: Float -> Int
horasTotales x | x >= 50 = 0
               | otherwise = round (x / 10)

               