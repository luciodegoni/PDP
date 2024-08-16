persona(nina,22, 160).
persona(marcos,8, 132).
persona(osvaldo,13, 129).
persona(charo,9, 152).

perteneceGrupoEtario(Persona,Grupo):-
    persona(Persona,Edad,_),
    grupoEtario(Grupo,E1,E2),
    between(E1,E2, Edad).

grupoEtario(ninio,0,12).
grupoEtario(adolescente,13,18). 
grupoEtario(joven,19,30).
grupoEtario(adulto,30,100).

atraccion(trenFantasma, parqueCosta).
atraccion(montaniaRusa, parqueCosta).
atraccion(toboganGigante, parqueAgua).
atraccion(mareMoto, parqueAgua).

requisito(trenFantasma, edad(12)).
requisito(montaniaRusa, altura(130)).
requisito(toboganGigante, altura(150)).
requisito(mareMoto, edad(5)).



puedeSubir(Persona, Atraccion):- 
    persona(Persona,_,_),
    atraccion(Atraccion, _),
    cumpleRequisito(Persona, Atraccion).

cumpleRequisito(Persona, Atraccion):- 
    persona(Persona,Edad, _),
    requisito(Atraccion, edad(EdadMinima)),
    Edad >= EdadMinima.

cumpleRequisito(Persona, Atraccion):- 
    persona(Persona, _,Altura),
    requisito(Atraccion, altura(AlturaMinima)),
    Altura >= AlturaMinima.

esParaElle(Parque,Persona):-
    persona(Persona,_,_),
    atraccion(_, Parque),
    forall(atraccion(Atraccion,Parque),puedeSubir(Persona,Atraccion)).

malaIdea(GrupoE, Parque):-
    grupoEtario(GrupoE,_,_),
    atraccion(_, Parque),
    not(atraccionParaTodos(GrupoE, Parque)).

atraccionParaTodos(GrupoE, Parque):-
    atraccion(Atraccion, Parque),
    forall((perteneceGrupoEtario(Persona, GrupoE), persona(Persona,_,_)),
            puedeSubir(Persona, Atraccion)).
    
% PROGRAMAS

programaLogico(Programa):-
    enElMismoParque(Programa),
    todosDistintos(Programa).

enElMismoParque(Programa) :-
    atraccion(_, Parque),
    forall(member(Atraccion, Programa), atraccion(Atraccion, Parque)).

todosDistintos([]).
todosDistintos([_]).
todosDistintos([H|T]) :-
    not(member(H, T)),
    todosDistintos(T).

% hastaAca/3, relaciona a una persona P y un programa Q, con el subprograma S que se compone de las atracciones iniciales de Q hasta la primera a la que P no puede subir (excluida obviamente).
% Por ejemplo, si el programa tiene 5 atracciones y P no puede subir a la tercera, pero sí a las dos primeras, el subprograma S deberá incluir a esas dos primeras atracciones.

hastaAca(_, [], []).
hastaAca(Persona, [Atraccion|T], [Atraccion|SubprogramaFinal]) :-
    puedeSubir(Persona, Atraccion),
    hastaAca(Persona, T, SubprogramaFinal).
hastaAca(Persona, [_|T], SubprogramaFinal) :-
    hastaAca(Persona, T, SubprogramaFinal).
