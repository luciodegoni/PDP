herramientasRequeridas(ordenarCuarto, [aspiradora(100), trapeador, plumero]).
herramientasRequeridas(limpiarTecho, [escoba, pala]).
herramientasRequeridas(cortarPasto, [bordedadora]).
herramientasRequeridas(limpiarBanio, [sopapa, trapeador]).
herramientasRequeridas(encerarPisos, [lustradpesora, cera, aspiradora(300)]).

cazaFantasma(egon, aspiradora(200)).
cazaFantasma(egon, trapeador).
cazaFantasma(egon, plumero).
cazaFantasma(peter, trapeador).
cazaFantasma(winston, varita).

tareaPedida(ordenarCuarto, maria, 40).
tareaPedida(cortarPasto, lucio, 15).
tareaPedida(limpiarBanio, sofia, 20).
tareaPedida(limpiarTecho, maria, 60).

precio(ordenarCuarto, 20).
precio(cortarPasto, 10).
precio(limpiarBanio, 40).
precio(limpiarTecho, 50).

satisfaceHerramienta(CazaFantasma, aspiradora(PotenciaRequerida)):-
    cazaFantasma(CazaFantasma, aspiradora(Potencia)),
    between(0, Potencia, PotenciaRequerida).
    
satisfaceHerramienta(CazaFantasma, Herramienta):-
    cazaFantasma(CazaFantasma, Herramienta).

satisfaceHerramienta(Persona, ListaRemplazables):-
    member(Herramienta, ListaRemplazables),
    satisfaceHerramienta(Persona, Herramienta).


puedeRealizar(CazaFantasma, Tarea):-
    herramientasRequeridas(Tarea,_),
    cazaFantasma(CazaFantasma, varita).

puedeRealizar(CazaFantasma, Tarea):-
        cazaFantasma(CazaFantasma, _),
        requiereHerramienta(Tarea, _),
        forall(requiereHerramienta(Tarea, Herramienta),
            satisfaceHerramienta(CazaFantasma, Herramienta)).
    
requiereHerramienta(Tarea, Herramienta):-
        herramientasRequeridas(Tarea, ListaDeHerramientas),
        member(Herramienta, ListaDeHerramientas).

precioPorTarea(Cliente, Tarea, Precio):-
    tareaPedida(Tarea, Cliente, Metros),
    precio(Tarea, PrecioPorMetro),
    Precio is PrecioPorMetro * Metros.

precioACobrar(Cliente, PrecioTotal):-
    tareaPedida(_, Cliente, _),
    findall(Precio, precioPorTarea(Cliente, _, Precio), ListaTareas),
    sum_list(ListaTareas, PrecioTotal).

tareaCompleja(limpiarTecho).
tareaCompleja(Tarea):-
    herramientasRequeridas(Tarea, ListaHerramientas),
    length(ListaHerramientas, Cantidad),
    Cantidad > 2.
    
aceptaPedido(CazaFantasma, Cliente):-
    puedeHacerPedido(CazaFantasma, Cliente),
    estaDispuestoAHacer(CazaFantasma, Cliente).

puedeHacerPedido(Trabajador, Cliente):-
    tareaPedida(Cliente, _, _),
    cazaFantasma(Trabajador, _),
    forall(tareaPedida(Cliente, Tarea, _),
    puedeRealizar(Trabajador, Tarea)).

estaDispuestoAHacer(peter, _).

estaDispuestoAHacer(ray, Cliente):-
    not(tareaPedida(limpiarTecho, Cliente, _)).
            
estaDispuestoAHacer(winston, Cliente):-
    precioACobrar(Cliente, PrecioACobrar),
    PrecioACobrar >= 500.
            
estaDispuestoAHacer(egon, Cliente):-
    not((tareaPedida(Cliente, Tarea, _), tareaCompleja(Tarea))).