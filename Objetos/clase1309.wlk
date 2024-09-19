// object algo{
//     const property x = [4,2,7,4,8,1]
//     method ordenar() = x.sortBy({a, b => a > b})
// }

object cartaCharizard {
    method valor () = 10

}

object cartaPikachu {
    method valor () = 6
}

object cartaAnchoDeEspada {
    method valor () = 2
}

object juanCruz {
    const cartas = []
    var dinero = 0
    method conseguirCarta(unaCarta)
    {
        cartas.add(unaCarta)
    }
    method tieneCarta(unaCarta) = cartas.contains(unaCarta)

    method vender() {
        dinero = dinero + cartas.first().valor()
        cartas.remove(cartas.first())
    }    
    method cuantaPlataTenes() = dinero
    method cuantasCartas() = cartas.size()
    method cotizacion() = cartas.sum({c => c.valor()})
    method tieneAlgunaCartaMuyValiosa() = cartas.any({c => c.valor() > 5})
    method lasCartasMasValiosas() =  cartas.filter({c => c.valor() >= 5})
    method listaPrecios() = cartas.map({c => c.valor()})
    method laMasCara()= cartas.max ({c=>c.valor()})
    method visitaExperto() {
        cartas.forEach({ carta => carta.revalorizar() })
    }
}
