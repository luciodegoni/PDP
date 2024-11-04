object pepita {
    var energia = 100

    method estaCansada(){
        return energia <=20
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