import parcialPlanetas.*

// PARTE 1

//MODELADO PERSONAS
const tino = new Persona(monedas = 100, edad = 20)

const lucho = new Persona(monedas = 110,edad = 20)

const nacho = new Persona(monedas = 20,edad = 5)

const tin = new Persona(monedas = 200,edad = 5)

//MODELADO CONSTRUCCIONES
const murallaChina= new Muralla(longitud = 15)

const muroBerlin = new Muralla(longitud = 5)

const museoLouvre = new Museo(superficie = 10,importante = 3)

//Modelado planetas

const tierra = new Planeta(personas = [tino, lucho, nacho, tin],construcciones = [murallaChina, muroBerlin, museoLouvre])

const saturno = new Planeta(personas = [tino, lucho, nacho, tin])

// PARTE 2

//Modelado constructores

const valen = new Constructor(edad= 20, cantConstrucciones = 6, region = "llanura")

const tom = new Constructor(edad= 27, cantConstrucciones = 3, region = "montania")

const mirko = new Constructor(edad= 20, cantConstrucciones = 2, region = "costa")

//Modelado productores

const nico = new Productor(edad =20, tecnicas = ["cultivo", "sembrado", "ganaderia", "mineria"])

//Modelado nuevo planeta

const marte = new Planeta(personas = [valen, tom, mirko, nico], construcciones = [])