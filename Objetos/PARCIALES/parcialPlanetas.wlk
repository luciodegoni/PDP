import modelados.*
class Persona{
    var monedas = 20
    var property edad
    method recursos() = monedas
    method esDestacado() {
        return self.recursos() > 30 || edad.between(18, 65)
    }
    method modificarCantMonedas(cantidad) {
        monedas += cantidad
    } 
    method cumplirAnios(){
        edad += 1
    }
}



class Construccion {
    method valor()
}
class Museo inherits Construccion {
    const property superficie
    const importante
    method importancia(cantImp){
        return cantImp.between(1, 5)
    } 
     override method valor() =
    if (importante.between(1, 5))
    {
        superficie * importante
    }


}

class Muralla inherits Construccion {
    const property longitud
    override method valor() = longitud * 10
}

class Planeta{
    const property personas = []
    const construcciones = []
    method delegacionDiplomatica() {
    const diplomaticos = personas.filter{persona => persona.esDestacado()}
    diplomaticos.add(personas.max{persona => persona.recursos()})
    return diplomaticos.asSet()
    }

    method esValioso() =
        construcciones.sum({construccion => construccion.valor()}) > 100
    
}

class Constructor inherits Persona{
    const property tecnicas = ["cultivo"]
    override method recursos() = monedas * tecnicas.size()
    override method esDestacado() = tecnicas.size() > 5
}
