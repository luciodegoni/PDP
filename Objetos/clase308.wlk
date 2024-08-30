object pepita {
 var energia = 100

    method estaCansada(){
        return energia <20
    }

    method vola(metros){
        energia = energia- metros * 10
    }

    method comer(comida) {
        energia += comida.energia()
    }
}

object alpiste {
    method energia() = 5
}

object manzana {
	var madurez = 0
	var pudrirse = 0

	method energia() {
		return 0.max((50 + 0.5 * madurez) - (pudrirse * 2))	
	}
	
	method madurar() {
		madurez += 10
        if(madurez < 100) madurez +=10 else pudrirse += 10
	}
}