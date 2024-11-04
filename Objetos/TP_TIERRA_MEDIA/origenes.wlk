// --------------------- ORIGENES ---------------------
object otraRaza{ 
  method valor(propietario) = 10 * propietario.cantArmas()
}
// El propietario es para que sean polimorficos
object razaElfico{
  method valor(propietario) = 25
}
object razaEnano{
  method valor(propietario) = 20
}

object razaHumano{
  method valor(propietario) = 15
}