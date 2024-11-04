object pepita {
    var energia = 100
    var position = game.at (1,8)
    method position () = position
    method position(newPos) {
        position = newPos
    }
    method image() = "flappybird-unscreen.gif"
    method estaCansada()= energia <= 20

    method vola(metros){
        energia -= metros * 10
    }

    method comer(comida) {
        energia += comida.energia()
    }
}

object alpiste {
    var position= game.at(18, 7)
    method esComestible() = true
    method energia() = 5
    method image() = "alpiste.png"
    method position () = position
    method position(newPos) {
        position = newPos
        }
    method eliminar(){
        game.removeVisual(self)
}
}

object manzana {
	var madurez = 0
	var pudrirse = 0
    var position= game.at(12,10)
    method esComestible() = true
    method image() = "manzana.png"
    method position () = position
    method position(newPos) {
        position = newPos
    }
	method energia() {
		return 0.max((50 + 0.5 * madurez) - (pudrirse * 2))	
	}
	
	method madurar() {
		madurez += 10
        if(madurez < 100) madurez +=10 else pudrirse += 10
	}
    method eliminar(){
        game.removeVisual(self)
    }
}

object nido {
    var position= game.at(35,7)
    method image()= "nido.png"
    method position () = position
    method position(newPos) {
        position = newPos
    }
}