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

    method viveAhi(persona) = personas.contains(persona)
    
}

class Productor inherits Persona{
    const property tecnicas = ["cultivo"]
    override method recursos() = monedas * tecnicas.size()
    override method esDestacado() = super() && tecnicas.size() > 5

    method realizarTecnica(tiempo, tecnica) {
        if(tecnicas.contains(tecnica)){
            self.modificarCantMonedas(3*tiempo) 
        }
        else {
            self.modificarCantMonedas(-1)
        }
    }

    method aprenderTecnica(tecnica) = tecnicas.add(tecnica)

    method trabajarEnPlaneta(planeta, tiempo){
        if(planeta.viveahi(self)){
            self.realizarTecnica(tiempo, tecnicas.last())
        }
        else{
            throw new Exception(message = "El productor no vive en el planeta, por lo que no puede trabajar allí")
        }
    }
}

class Constructor inherits Persona{
    var property cantConstrucciones
    const property region
    override method recursos() = super() + 10*cantConstrucciones
    override method esDestacado() = cantConstrucciones > 5

}

object costa {

}

object montania {

}


object llanura {
    
}