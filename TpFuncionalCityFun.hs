valorCiudad :: Int -> [String] -> Int -> Int
valorCiudad x [] y | x <1800 = 5* (1800-x)
                   | otherwise = 2*y
valorCiudad x _ y |x <1800 = 5* (1800-x)
                  | otherwise = 3*y 

esCopada 