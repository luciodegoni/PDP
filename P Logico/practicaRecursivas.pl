% Caso base: la permutación de una lista vacía es una lista vacía.
permutacion([], []).

% Caso recursivo: selecciona un elemento E de la lista [E|Es], permuta el resto de la lista,
% y luego inserta E en todas las posiciones posibles de cada permutación.
permutacion(L, [E|PermutacionResto]) :-
    seleccionar(E, L, Resto),
    permutacion(Resto, PermutacionResto),
    insertar(E, PermutacionResto, L).

% Selecciona un elemento de la lista, devolviendo el elemento seleccionado, y el resto de la lista sin ese elemento.
seleccionar(E, [E|Es], Es).
seleccionar(E, [X|Xs], [X|Ys]) :- seleccionar(E, Xs, Ys).

% Inserta un elemento en todas las posiciones posibles de la lista.
insertar(E, Lista, [E|Lista]).
insertar(E, [X|Xs], [X|Ys]) :- insertar(E, Xs, Ys).

% ----------------------------------------------------------------------------------------------------------------------------------

combinar([], []).
combinar([Persona|PersonasPosibles], [Persona|Personas]):-combinar(PersonasPosibles, Personas).
combinar([_|PersonasPosibles], Personas):-combinar(PersonasPosibles, Personas).

% ----------------------------------------------------------------------------------------------------------------------------------

episodiosSiguientes(Episodio, EpisodioSiguiente):-
    precedeA(Episodio,EpisodioSiguiente).

episodiosSiguientes(Episodio,EpisodioPosterior):-
    precedeA(Episodio,EpisodioSiguiente),
    episodiosSiguientes(EpisodioSiguiente,EpisodioPosterior).

% ----------------------------------------------------------------------------------------------------------------------------------

diferenciaEntreNiveles(Nivel,Nivel,0).
diferenciaEntreNiveles(Nivel1,Nivel2,1):-
    nivelSuperior(Nivel1,Nivel2).
diferenciaEntreNiveles(Nivel1,Nivel2,CantFinal):-
    not(nivelSuperior(Nivel1,Nivel2)),
    nivelSuperior(Nivel1,Intermediario),
    diferenciaEntreNiveles(Intermediario,Nivel2,Cant),
    CantFinal is Cant + 1.