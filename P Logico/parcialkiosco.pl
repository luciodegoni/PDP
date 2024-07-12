atiende(dodain,lunes,horario(9,15)).
atiende(dodain,miercoles,horario(9,15)).
atiende(dodain,viernes,horario(9,15)).

atiende(lucas,martes,horario(10,20)).

atiende(juanC,sabados,horario(18,22)).
atiende(juanC,domingos,horario(18,22)).

atiende(juanFdS,jueves,horario(10,20)).
atiende(juanFdS,viernes,horario(12,20)).

atiende(leoC,lunes,horario(14,18)).
atiende(leoC,miercoles,horario(14,18)).

atiende(martu,miercoles,horario(23,24)).

atiende(vale,Dia,Horario):-
    atiende(dodain,Dia,Horario).
atiende(vale,Dia,Horario):-
    atiende(juanC,Dia,Horario).


quienAtiende(Persona, Dia, Hora) :-
    atiende(Persona, Dia, horario(HoraInicio, HoraFin)),
    between(HoraInicio, HoraFin, Hora).
    

foreverAlone(Persona, Dia, Hora):-
    quienAtiende(Persona, Dia, Hora),
    not((quienAtiende(Persona1,Dia,Hora),quienAtiende(Persona2, Dia, Hora), Persona1 \= Persona2)).

quienesEstan(Persona, Dia):-
     findall(Persona, distinct(quienAtiende(Persona, Dia, _)), PosiblesPersonas),
     combinar(PosiblesPersonas, Persona).

combinar([], []).
combinar([Persona|PersonasPosibles], [Persona|Personas]):-combinar(PersonasPosibles, Personas).
combinar([_|PersonasPosibles], Personas):-combinar(PersonasPosibles, Personas).

venta(dodain, fecha(lunes, 10, agosto), golosina(1200), 1).
venta(dodain, fecha(lunes, 10, agosto), cigarrillos([jockey]), 2).
venta(dodain, fecha(lunes, 10, agosto), golosina(50), 3).
venta(dodain, fecha(miercoles, 12, agosto), bebida(alcoholica, 8), 1).
venta(dodain, fecha(miercoles, 12, agosto), bebida(no-alcoholica, 1), 2).
venta(dodain, fecha(miercoles, 12, agosto), golosina(10), 3).
venta(martu, fecha(miercoles, 12, agosto), golosinas(1000),1).
venta(martu, fecha(miercoles, 12, agosto), cigarrillos([chesterfield, colorado, parisiennes], 2)).
venta(lucas, fecha(martes, 11, agosto), golosina(600), 1).
venta(lucas, fecha(martes, 18, agosto), bebida(no-alcoholica, 2), 1).
venta(lucas, fecha(martes, 18, agosto), cigarrillos([derby]), 2).

ventaImportante(golosinas(Valor)):-
    Valor > 100.

ventaImportante(cigarrillos(Marcas)):-
    length(Marcas, Cant),
    Cant > 2.

ventaImportante(bebida(no-alcoholica, Cantidad)):- 
    Cantidad > 5.

ventaImportante(bebida(alcoholica, _)).

atiendeEseDia(Persona, Fecha):- venta(Persona, Fecha, _, _).

esSuertudo(Persona):-
    venta(Persona, _, _, _),
    forall(atiendeEseDia(Persona, Fecha), (venta(Persona, Fecha ,Producto,1), ventaImportante(Producto))).



