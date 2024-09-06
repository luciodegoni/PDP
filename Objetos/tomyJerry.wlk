object tom {
    method energia() {return energia} // Hago un getter para Tom asi puedo ver la energia que tiene
    var energia = 50
    method correr(metros) {
        energia -= self.energiaGastada(metros)
    }
    method energiaGastada(metros) = metros / 2

    method energiaQueAporta(raton)
    {
        return 12 + raton.peso()
    }
    method comer(raton){
        energia += self.energiaQueAporta(raton) 
    }

    method velocidadMaxima () {
        return 5 + energia / 10
    }  

    method puedeComer(distancia){
    return energia >= self.energiaGastada(distancia)
    }

    method quiereComer(distancia, raton){
    return self.puedeComer(distancia) && self.energiaGastada(distancia) < self.energiaQueAporta(raton) 
    }
    
}
object jerry {
    var _edad = 2
    method peso(){
        return _edad * 20
    }
    //getter
    method edad() {return _edad}

    // setter
     method edad(_edadNueva) {_edad= _edadNueva}
}

object nibbles {
    method peso () = 35
}


