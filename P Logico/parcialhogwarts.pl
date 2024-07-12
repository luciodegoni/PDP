%Base de Conocimientos

mago(harry, mestizo, [coraje, amistad, orgullo, inteligencia], slytherin).

mago(draco, puro, [inteligencia, orgullo], hufflepuff).

mago(hermione, impura, [inteligencia, orgullo, responsabilidad], _).

mago(neville, puro, [amistad], _).

% Punto 1
puedeSerSlytherin(Persona):- mago(Persona, mestizo, _, _).

puedeSerSlytherin(Persona):- mago(Persona, puro, _, _).

% Punto 2
casa(gryffindor, Persona):- 
    mago(Persona, _, Virtudes, _),
    member(coraje, Virtudes).

casa(slytherin, Persona):-
    mago(Persona, _, Virtudes, _),
    member(orgullo, Virtudes),
    member(inteligencia, Virtudes).

casa(ravenclaw, Persona):-
    mago(Persona, _, Virtudes, _),
    member(inteligencia, Virtudes),
    member(responsabilidad, Virtudes).

casa(hufflepuff, Persona):-
    mago(Persona, _, Virtudes, _),
    member(amistoso, Virtudes).

% Punto 3
puedeEntrar(gryffindor, hermione).

puedeEntrar(Casa, Persona):-
    casa(Casa, Persona),
    not(mago(Persona,_,_, Casa)).

sombreroSeleccionador(Casa, Persona):- puedeEntrar(Casa, Persona).

sombreroSeleccionador(Casa, Persona):- 
    puedeSerSlytherin(Persona),
    puedeEntrar(Casa, Persona).

% Punto 4
cadenaDeAmistades([]).
cadenaDeAmistades([Mago|Magos]):-
    sonTodosAmistosos([Mago|Magos]),
    mismaCasaQueElSiguiente(Mago, Magos),
    cadenaDeAmistades(Magos).
    

sonTodosAmistosos(Magos):-
    forall(member(Mago, Magos),(mago(Mago,_, Virtudes, _), member(amistad, Virtudes))).

mismaCasaQueElSiguiente(_|[]).
mismaCasaQueElSiguiente(Mago, [OtroMago|_]):-
    sombreroSeleccionador(Casa, Mago),
    sombreroSeleccionador(Casa, OtroMago).

% 2da Parte

accion(harry, fueraDeCama).
accion(hermione, fueA(secProBiblioteca)).
accion(hermione, fueA(tercerPiso)).
accion(harry, fueA(bosque)).
accion(harry, fueA(tercerPiso)).
accion(draco, fueA(mazmorras)).
accion(ron, buenaAccion(ganoAjedrez, 50)).
accion(hermione, buenaAccion(salvoAmigos, 50)).
accion(harry, buenaAccion(ganoVoldemort, 60)).

esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).

malaAccion(fueA(bosque),-50).
malaAccion(fueA(seccionResBiblioteca),-10).
malaAccion(fueA(tercerPiso),-75).
malaAccion(fueraDeCama,-75).

% Punto 1
esBuenAlumno(Mago):-
    accion(Mago,_),
    noTieneMalasAcciones(Mago).

noTieneMalasAcciones(Mago):-
    accion(Mago, fueA(Lugar)),
    not(malaAccion(fueA(Lugar),_)).

esRecurrente(Accion):-
    accion(Mago1, Accion),
    accion(Mago2, Accion),
    Mago1 \= Mago2. 

% Punto 2

puntajeTotal(Casa, Puntaje):-
    casa(Casa,_),
    findall(Puntos, (esDe(Mago, Casa), accion(Mago, Accion), puntajeAccion(Accion, Puntos)), Puntajes),
    sum_list(Puntajes, Puntaje).

puntajeAccion(buenaAccion(_, Puntos), Puntos).
puntajeAccion(Accion,Puntos):-
    malaAccion(Accion,Puntos).

casaGanadora(Casa):-
    findall(Puntaje, puntajeTotal(_, Puntaje), Puntajes),
    max_list(Puntajes, PuntajeMax),
    puntajeTotal(Casa, PuntajeMax).