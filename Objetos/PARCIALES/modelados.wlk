import parcialPlanetas.*

//MODELADO PERSONAS
const tino = new Persona(
    monedas = 100,
    edad = 20
)

const lucho = new Persona(
    monedas = 110,
    edad = 20
)

const nacho = new Persona(
    monedas = 20,
    edad = 5
)

const lauti = new Persona(
    monedas = 200,
    edad = 5
)

//MODELADO CONSTRUCCIONES
const murallaChina= new Muralla(
    longitud = 15
)

const muroBerlin = new Muralla(
    longitud = 5
)

const museoLouvre = new Museo(
    superficie = 10,
    importante = 3
)

//Modelado planetas

const tierra = new Planeta(
    personas = [tino, lucho, nacho, lauti],
    construcciones = [murallaChina, muroBerlin, museoLouvre]
)

const saturno = new Planeta(
    personas = [tino, lucho, nacho, lauti]
)