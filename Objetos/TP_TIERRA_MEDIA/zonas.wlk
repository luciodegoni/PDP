// --------------------- ZONAS ---------------------
class Zona{
    var property requerimientoExtra = sinRequerimiento // revisar CORRECCIONES
    // method cumple condicion inicial y ciumple condicion extra
    // puede pasar usa ambos metodos
}

class ZonaPoder inherits Zona{
    const property poderMinimo 
    method puedePasar(algo) = algo.poder() > poderMinimo && requerimientoExtra.cumple(algo) // condInicial && condExtra
    method recorrer(algo) {}
}

class ZonaPeligrosa inherits Zona{
    const property danio
    method puedePasar(algo) = algo.estaArmado() && requerimientoExtra.cumple(algo)
    method recorrer(algo) = if (self.puedePasar(algo)) {algo.perderVida(danio)}
}

const lebennin = new ZonaPoder(poderMinimo=1500)
const minasTirith = new ZonaPeligrosa(danio=10)
object lossarnach inherits Zona() {
    method puedePasar(algo) = true
    method recorrer(algo) = algo.ganarVida(1)
}

class Region {
  const property camino
  method modificarCamino(nuevoCamino) {
      camino.clear()
      nuevoCamino.forEach({lugar => camino.add(lugar)})
  }
  method agregarLugares(lugar){
    camino.add(lugar)
  }

  method puedePasar(algo) = camino.all{zona => zona.puedePasar(algo)}
  
  method recorrer(algo) {
    if (self.puedePasar(algo)) {
        camino.forEach{zona => zona.recorrer(algo)}
    }
  }
}

// const gondor = new Region (camino = [lebennin, minasTirith])


object sinRequerimiento {method cumple(grupo) = true}

class RequerimientoElemento { // CORRECCIONES es que UNO CUMPLA
  var property elemento
  var property cantidad
  method cumple(algo) = algo.tieneMasDe(cantidad,elemento)
}

class RequerimientoGuerrero {
  const loQuePide
  const cantidad
  method cumple(algo) = loQuePide.condicion(algo) > cantidad
}

const masDe2Armas = new RequerimientoGuerrero(loQuePide = cantArmas, cantidad = 2)
const masDe4Poder = new RequerimientoGuerrero(loQuePide = poder, cantidad = 4)
const masDe10Vida = new RequerimientoGuerrero(loQuePide = vida, cantidad = 10)

const gondor = new Region(camino = [lebennin,minasTirith])

object cantArmas {
  method condicion(algo) = algo.cantArmas()
}

object poder {
  method condicion(algo) = algo.poder()
}

object vida {
  method condicion(algo) = algo.vida()
}

const lembas10 = new RequerimientoElemento(elemento = "lembas", cantidad = 10)
const pociones5 = new RequerimientoElemento(elemento = "poción", cantidad = 5)

/*
Para los tests:
  Por minasTirith solo pueden pasar: froddo, gimli, legolas, aragorn, tomBombadil
  Por lossarnach solo pueden pasar: froddo, gimli, legolas, aragorn, gollum, tomBombadil, gandalf
  Por lebennin solo pueden pasar gimli y tomBombadil
*/


// torotis
/*
  - Diferenciar herencia y composicion (aclarar)
  - Polimorfismo
  - Delegar responsabilidades (muchas lineas en una clase)(god class NO)
  - Cohesión y encapsulasión. Inicializar en caso de que a futuro puedan añadirse metodos y cosas
*/