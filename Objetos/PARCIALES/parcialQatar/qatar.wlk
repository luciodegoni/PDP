class Plato {
    method azucar()
    method cantidadCalorias() = self.azucar() * 3 + 100
    method esBonito()
}

class Entrada inherits Plato () {
    override method esBonito() = true
    override method azucar() = 0

}

class Principal inherits Plato {
    var cantAzucar
    var bonito
    override method esBonito() = bonito
    override method azucar() = cantAzucar
}

class Postre inherits Plato {
    var cantColores
    override method azucar() = 120
    override method esBonito() = cantColores > 3
}

class Cocinero {
    var property puesto
    var property requerimientoPlato 
    method catarPlato(plato)= puesto.catar(plato, requerimientoPlato)
    method ascender(nuevaEspecialidad){puesto = nuevaEspecialidad}

}

object pastelero {
    method catar(plato, requerimientoPlato) = (5*plato.azucar()) / requerimientoPlato
}

class Chef {
    method catar(plato, requerimientoPlato) {
        if(self.cumpleCriterio(plato, requerimientoPlato)){
            return 10
        }
        else return 0
    }
    method cumpleCriterio(plato, requerimientoPlato) = plato.esBonito() && plato.cantCalorias() < requerimientoPlato
}

object souschef inherits Chef{
    override method catar(plato, requerimientoPlato) =
        if(self.cumpleCriterio(plato, requerimientoPlato)){
            return super(plato, requerimientoPlato)
        }
        else{
            return (plato.cantidadCalorias()/100).min(6)
        }
    }

