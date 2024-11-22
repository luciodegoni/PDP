class Empleado {
    
    const habilidades  = []
    var property salud = 100
    var property puesto
    method esIncapacitado() = salud < self.saludCritica()
    method saludCritica() = puesto.saludCritica()
    method tieneHabilidad(habilidad) = habilidades.contains(habilidad)
    method puedeUsar(habilidad) = not self.esIncapacitado() && self.tieneHabilidad(habilidad)
    
}

class Jefe inherits Empleado{
    const subordinados = []
    override method tieneHabilidad(habilidad) = super(habilidad) || self.algunSubordinadoLaTiene(habilidad)
    method algunSubordinadoLaTiene(habilidad) = 
        subordinados.any{subordinado => subordinado.puedeUsar(habilidad)}
}
class PuestoEspia {
   method saludCritica() = 15
}
class PuestoOficinista inherits Empleado{
    var cantEstrellas = 0
    method ganarEstrella(estrella) {cantEstrellas += 1}
    override method saludCritica() = 40- 5*cantEstrellas

}