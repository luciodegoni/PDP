class Isis {
    const misiones = []
    var property salud = 100
    const saludCritica
    method esIncapacitado() = salud < saludCritica
    method completarMision(mision) = misiones.add(mision)
}

class Espia inherits Isis(saludCritica = 15) {
    
}