type Marea = String
type ElementoPaisaje = String
type Idioma = String
type MinutosCaminata = Int
type Excursion = Turista -> Turista
type Indice = Turista -> Int
type Tour = [Excursion]
type Tours = [Tour]
type Espiritualidad = Int

data Turista = UnTurista {
    cansancio :: Int,
    estres :: Int,
    viajaSolo :: Bool,
    idiomas :: [String]
} deriving Show

ejIrALaPLaya :: Turista -> Turista
ejIrALaPLaya turista
    | viajaSolo turista = turista { cansancio = cansancio turista - 5 }
    | otherwise = turista { estres = estres turista - 1 }

ejApreciarPaisaje :: ElementoPaisaje -> Turista -> Turista
ejApreciarPaisaje elemento turista = turista { estres = estres turista - length elemento }

ejSalirAHablarUnIdioma :: Idioma -> Turista -> Turista
ejSalirAHablarUnIdioma idioma turista = turista { idiomas = idiomas turista ++ [idioma] }

ejCaminar :: MinutosCaminata -> Turista -> Turista
ejCaminar minutos turista = turista { cansancio = cansancio turista + intensidad minutos, estres = estres turista - intensidad minutos }

intensidad :: Int -> Int
intensidad num = num `div` 4

ejPaseoEnBarco :: Marea -> Turista -> Turista
ejPaseoEnBarco marea turista
    | marea == "fuerte" = turista { cansancio = cansancio turista + 10, estres = estres turista + 6 }
    | marea == "moderada" = turista
    | marea == "tranquila" = ejSalirAHablarUnIdioma "aleman" (ejApreciarPaisaje "mar" (ejCaminar 10 turista))

ana :: Turista
ana = UnTurista 0 21 False ["espaniol"]

beto :: Turista
beto = UnTurista 15 15 True ["aleman"]

cathi :: Turista
cathi = UnTurista 15 15 True ["aleman", "catalan"]

hacerExcursion :: Turista -> Excursion -> Turista
hacerExcursion turista excursion = excursion (turista { estres = estres turista - 1 })

deltaSegun :: (a -> Int) -> a -> a -> Int
deltaSegun f algo1 algo2 = f algo1 - f algo2

deltaExcursionSegun :: Indice -> Turista -> Excursion -> Int
deltaExcursionSegun indice turista excursion = deltaSegun indice turista (excursion turista)

esEducativa :: Turista -> Excursion -> Bool
esEducativa turista excursion = length (idiomas (excursion turista)) > length (idiomas turista)

esDesestresante :: Turista -> Excursion -> Bool
esDesestresante turista excursion = deltaExcursionSegun estres turista excursion > 2

hacerTour :: Tour -> Turista -> Turista
hacerTour tour turista = foldl (\t exc -> exc t) turista tour

ejCompleto :: Tour
ejCompleto = [ejCaminar 20, ejApreciarPaisaje "cascada", ejCaminar 40, ejSalirAHablarUnIdioma "melmacquiano"]

ejLadoB :: Excursion -> Tour
ejLadoB excursionElegida = [ejPaseoEnBarco "tranquila", excursionElegida, ejCaminar 120]

tourIslaVecina :: String -> Tour
tourIslaVecina marea
    | marea == "fuerte" = [ejPaseoEnBarco marea, ejApreciarPaisaje "lago", ejPaseoEnBarco marea]
    | otherwise = [ejPaseoEnBarco marea, ejIrALaPLaya, ejPaseoEnBarco marea]

quedaAcompanado :: Excursion -> Turista -> Bool
quedaAcompanado excursion turista = not (viajaSolo (excursion turista))

esExcursionConvincente :: Excursion -> Turista -> Bool
esExcursionConvincente excursion turista = esDesestresante turista excursion && quedaAcompanado excursion turista

esTourConvincente :: Tour -> Turista -> Bool
esTourConvincente tour turista = any (\exc -> esExcursionConvincente exc turista) tour

existeTourConvincente :: Tours -> Turista -> Bool
existeTourConvincente tours turista = any (\tour -> esTourConvincente tour turista) tours

efectividad :: Tour -> [Turista] -> Int
efectividad tour = sum . map (espiritualidadAportada tour) . filter (esTourConvincente tour)

espiritualidadAportada :: Tour -> Turista -> Espiritualidad
espiritualidadAportada tour = negate . deltaRutina tour

deltaRutina :: Tour -> Turista -> Int
deltaRutina tour turista =
  deltaSegun nivelDeRutina (hacerTour tour turista) turista

nivelDeRutina :: Turista -> Int
nivelDeRutina turista = cansancio turista + estres turista

tourInfinitasPlayas :: Tour
tourInfinitasPlayas = repeat ejIrALaPLaya
