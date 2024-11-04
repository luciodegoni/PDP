import origenes.*
import armas.*

// --------------------- GUERREROS --------------------- //
class Guerrero{
  var property vida
  // var property favtorVida = 1 CORRECCIONES
  const armas = []
  const elementos = []
  const property origen
  method desarmar() {armas.clear()}
  method cantArmas() = armas.size()
  method estaArmado() = armas.size() > 0
  method cuantosTiene(elemento) = elementos.filter({elem => elem == elemento}).size()
  method calcularPoder(factorVida,factorInventario) = self.vida() * factorVida + factorInventario * self.poderArmas()
  method perderVida(cantidad) {                       // self.vida() CORRECCIONES
    if(vida - cantidad <= 0) {
      vida = 0
    }
    else {
      vida -= cantidad
    }
  } 
  method ganarVida(cantidad) {
    if (vida + cantidad >= 100) {
      vida = 100
    }
    else {
      vida += cantidad
    }
  }
  method conseguirArma(arma) {
    armas.add(arma)
  }
  method conseguirElemento(elemento){
    elementos.add(elemento)
  }
  method poderArmas() = armas.sum({a => a.fuerza(self)})
  method tieneMasDe(cantidad,elemento) = self.cuantosTiene(elemento) > cantidad
}

class Hobbit inherits Guerrero(origen = otraRaza){
  method poder() = self.calcularPoder(1,elementos.size())
  // method poder() = vida + elementos.size() * self.poderArmas()
}

class Enano inherits Guerrero(origen = razaEnano){
  const factorPoder
  method poder() = self.calcularPoder(1,factorPoder)
}

class Elfo inherits Guerrero(origen = razaElfico){
  var property destrezaBase = 2
  var property destrezaPropia

  method poder() = self.calcularPoder(1,destrezaBase + destrezaPropia)
}

class Humano inherits Guerrero(origen = razaHumano){
  const limitadorPoder

  method poder() {
    if(limitadorPoder == 0){
      throw new Exception(message = "¡El limitador es 0!") 
    }
    else{
      return self.calcularPoder(1, 1/limitadorPoder)
    }
  }
}

class Maiar inherits Guerrero(origen = otraRaza){
  var property poderBasico = 15
  var property poderBajoAmenaza = 300 

  method factorActual(){
    if(vida>=10){
      return poderBasico
    }
    else return poderBajoAmenaza
  }

  method poder() = self.calcularPoder(self.factorActual(), 2)
  // method poder() = vida * self.factorActual() + 2 * self.poderArmas()
}

object gollum inherits Hobbit(vida = 100, origen = otraRaza){ // Es un hobbit
  override method poder() = super()/2
}

object tomBombadil inherits Guerrero(vida = 100, origen = otraRaza){
  method poder() = 10000000
  override method estaArmado() = true
  override method perderVida(cant) {}
  override method ganarVida(cant) {}
}

object gandalf inherits Maiar(vida = 100){}

class Grupo {
  const property grupo = []
  method poder() = grupo.min({personaje => personaje.poder()}).poder()
  //La primer parte (grupo.min({personaje => personaje.poder()})) encuentra el miembro con menor poder del grupo por eso después hago .poder()
  method cuantosTiene(elemento) = grupo.sum({personaje => personaje.cuantosTiene(elemento)})
  method estaArmado() = grupo.all({personaje => personaje.estaArmado()})
  method perderVida(danio) = grupo.forEach({personaje => personaje.perderVida(danio)})
  method ganarVida(vida) = grupo.forEach({personaje => personaje.ganarVida(vida)})
  method tieneMasDe(cantidad,elemento) = self.cuantosTiene(elemento) > cantidad

  method quienesPuedenPasarPor(lugar) = grupo.filter({persona => lugar.puedePasar(persona)})
}

const froddo = new Hobbit(
  vida = 50,
  armas = [
      new Daga(multiplicador = 8)
  ],
  elementos = ["lembas","lembas","lembas","lembas","pocion"]
)

const gimli = new Enano(
  vida = 75,
  factorPoder = 3, 
  armas = [
      new Hacha(largoMango = 70, pesoHoja = 5),
      new Hacha(largoMango = 70, pesoHoja = 5)
  ],
  elementos = ["lembas","lembas","lembas","lembas","pocion"]
)

const legolas = new Elfo(
  vida = 80,
  destrezaPropia = 1,
  armas = [
      new Espada(multiplicador = 12)
  ],
  elementos = ["lembas","lembas","lembas"]
)

const aragorn = new Humano(
  vida = 85,
  armas = [
      new Espada(multiplicador = 18),
      new Daga(multiplicador = 10)
  ],
  limitadorPoder = 20
)