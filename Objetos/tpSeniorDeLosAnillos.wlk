object gandalf{

// Getter y setter para poder mostrar y averiguar la vida
    var vida = 100
    const armas = []
// Vida
    method vida()
    {
        return vida
    }
    method setearVida(vidaGandalf){
        vida = vidaGandalf
    }
    method perderVida(cantidad){
    if(vida - cantidad <= 0){
      vida = 0
    }
    else {
      vida -= cantidad
    }
  } 

  method aumentarVida(cantidad){
    if (vida + cantidad >= 100){
      vida = 100
    }
    else {
      vida += cantidad
    }
  }
// Poder
     method poder(){
        if(vida >= 10){
        return (vida*15 + self.poderArmas()*2)
        }
        else {
        return (vida*300 + self.poderArmas()*2)
        }
  }
  method poderArmas() = armas.sum({a => a.poder()})

// Agregar y quitar armas
  method agregarArma(unArma) {armas.add(unArma)}
  method quitarArma(unArma) {armas.remove(armas.first())}
  method armas() = armas

}

object baculo{
    method poder() = 400
}

object espada{
    var origen = "elfico"

    method origen(nuevoOrigen) {
        origen = nuevoOrigen}

    method poder() {
        if (origen =="enano"){
            return 10*20
        }
        else if (origen=="elfico"){
            return 10*25
        }
        else{
            return 10*15
        }
    }
}

object lebennin{
    method puedePasar(guerrero) = guerrero.poder() > 1500

}

object minasTirith{
    method puedePasar(guerrero) =
        guerrero.armas().size() > 0

    method consecuencias(guerrero) =
        guerrero.perderVida(10)
    
}

object lossarnach{
    method consecuencias(guerrero) =
        guerrero.aumentarVida(1)
    
}

object gondor{
const camino = []
method agregarLugar(lugar){camino.add(lugar)}
method recorrerCamino(guerrero){
    var pasa = true
    camino.map({ lugar =>
      if(lugar.puedePasar(guerrero) && pasa) {
        lugar.consecuencias(guerrero)
      }
      else {
        pasa = false
      }
    })
    return pasa
  }
}