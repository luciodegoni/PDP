import origenes.*

// --------------------- ARMAS ---------------------
object glamdring inherits Espada(multiplicador = 10){ //Tiene que heredar espada porque es una espada
  var property origen = razaElfico // Por defecto es elfico

  override method fuerza(propietario) = origen.valor(propietario) * multiplicador
}

const baculo = new Baculo(poder = 400) // baculo de Gandalf para la parte 1

class Espada {
  var property multiplicador
  method fuerza(propietario) = multiplicador * propietario.origen().valor(propietario)
}

class Baculo {
  const property poder 
  method fuerza(propietario) = poder
}

class Daga inherits Espada{
  override method fuerza(propietario) = super(propietario)/2
}

class Hacha{
  var property largoMango
  var property pesoHoja

  method fuerza(propietario) = largoMango*pesoHoja 
}