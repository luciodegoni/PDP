class Operacion{
    const property valorInmueble 
    const empleados = []
    method comision()

}

class Alquiler inherits Operacion {
    const cantMesesContrato

    override method comision() = (cantMesesContrato * valorInmueble) / 50000 
}

class Venta inherits Operacion{
    const porcentaje

    override method comision() = valorInmueble * (porcentaje/100) 

}

class Inmueble {
    const tamanio
    const cantAmbientes
    const operacion

    method valor()
}

class Casa inherits Inmueble {
    const precio
    override method valor() = precio 
}

class PH inherits Inmueble {
    const valorPorMetro = 14000
    const tamanioMinimo = 36
    override method valor() = self.calcularPrecio()
    method calcularPrecio() {
        if(tamanio > tamanioMinimo){
            return tamanio * valorPorMetro
        }
        else{
            throw new Exception(message = "No tiene la cantidad de metros suficientes para ser cotizado")
        }
            
    }
}

class Departamento inherits Inmueble {
    const valorPorAmbiente = 350000
    override method valor() = cantAmbientes * valorPorAmbiente
}