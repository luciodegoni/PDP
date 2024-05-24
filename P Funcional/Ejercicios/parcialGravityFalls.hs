import Text.Show.Functions

type Captura = Bool
type Criaturas = [Criatura]
data Criatura = UnaCriatura {
    nivelPeligrosidad :: Int,
    puedoDeshacerme ::  (Persona -> Bool)
} deriving (Show)

data Persona = UnaPersona {
    edad :: Int,
    inventario :: [String],
    experiencia :: Int
} deriving (Show)

puedoDeshacermeSiempreDetras:: Persona -> Bool
puedoDeshacermeSiempreDetras persona = True

siempreDetras :: Criatura
siempreDetras = UnaCriatura 0 puedoDeshacermeSiempreDetras


gnomos cantidad= UnaCriatura  (2 ^ cantidad) (elem "Soplador de hojas" . inventario)


fantasmas :: Int -> (Persona -> Bool) -> Criatura
fantasmas poder asunto = UnaCriatura (poder *20) asunto

enfrentamiento :: Persona -> Criatura -> Persona
enfrentamiento persona criatura 
    | puedoDeshacerme criatura persona = persona {experiencia= experiencia persona + nivelPeligrosidad criatura}
    | otherwise = persona {experiencia = experiencia persona + 1}

ganaExp :: Persona -> Criaturas   -> Persona
ganaExp persona criaturas = foldl enfrentamiento persona criaturas

condicion1 :: Persona -> Bool
condicion1 persona = edad persona < 13 && "disfraz de oveja" `elem` inventario persona

condicion2 :: Persona -> Bool
condicion2 persona = experiencia persona >= 10

listaCriaturas :: Criaturas
listaCriaturas = [gnomos 10, siempreDetras, fantasmas 3 condicion1, fantasmas 1 condicion2]

dipper :: Persona
dipper = UnaPersona 12 ["Soplador de hojas", "disfraz de oveja"] 20

wendy :: Persona
wendy = UnaPersona 19 ["Soplador de hojas"] 10

abecedarioDesde :: Char -> [Char]
abecedarioDesde letra = moverabecedario letra abecedario

moverabecedario :: Char -> [Char] -> [Char]
moverabecedario letra (x:xs)
    | x== letra = (x:xs)
    | otherwise = moverabecedario letra (xs ++ [x])

abecedario = ['a'..'z']