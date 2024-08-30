object tom {
    method energia() {return energia} // Hago un getter para Tom asi puedo ver la energia que tiene
    var energia = 50
    method correr(metros) {
        energia -= metros / 2
    }
    method comer(raton){
        energia += 12 + raton.peso()
    }

    method velocidadMaxima () {
        return 5 + energia / 10
    }
}
object jerry {
    var edad = 2
    method peso(){
        return edad * 20
    }
    //getter
    method edad() {return edad}

    // setter
     method edad(_edad) {edad= _edad}
}

object nibbles {
    method peso () = 35
}


