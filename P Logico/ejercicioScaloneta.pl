% Punto 1: Acciones del partido
% Conocemos el nombre de cada jugador y las acciones que fueron pasando en el partido.
% Las cuales son:
% el dibu hizo una atajada en el minuto 122. También, en la tanda de penales atajó 2 de ellos.
% messi metió 2 goles, uno en el minuto 108 de jugada y otro en el minuto 23 de penal. A su vez, también metió el primer penal de la tanda.
% montiel metió el último penal de la tanda de penales.
% Se pide modelar la base de conocimientos con las acciones y quienes las realizaron.

jugador(dibu).
jugador(messi).
jugador(montiel).

accion(dibu, atajada(122)).
accion(dibu, atajadaPenal(2)).
accion(messi, gol(108)).
accion(messi, gol(23)).
accion(messi, penal(1)).
accion(montiel, penal(5)). 

% Punto 2: Puntajes de las acciones
% Queremos saber cuantos puntos suma cada acción. Los cuales son calculados de la siguiente forma:

% Para las atajadas tanda de penales, suman 15 * la cantidad que se hayan atajado

puntos(atajadaPenal(Cantidad), Puntos) :- Puntos is Cantidad * 15.
 
% Para las otras atajadas, el puntaje se calcula como el minuto en el que ocurrió más 10

puntos(atajada(Minuto), Puntos) :- Puntos is Minuto + 10.

% Para los goles, se calcula como el minuto en el que se metió más 20

puntos(gol(Cantidad), Puntos) :- Puntos is Cantidad + 20.

% Por último, para los penales que se metieron, en caso de que sea el primero suma  45 puntos
% mientras que si es el último suma 80 puntos

puntos(penal(1), 45).
puntos(penal(5), 80). 

% También, queremos saber cuantos puntos suma cada jugador. Es necesario que este predicado sea inversible.

puntajeJugadorAccion(Jugador,Puntaje):-
    accion(Jugador, Accion),
    puntos(Accion, Puntaje).
puntajeJugador(Jugador, Puntos) :-
    jugador(Jugador),
    findall(Puntaje, puntajeJugadorAccion(Jugador, Puntaje), Puntajes),
    %findall: el primer parámetro es el que importa, el segundo es la verificación, el tercero es la variable donde se guarda la lista.

    sum_list(Puntajes, Puntos).
    
puntajeListaJugador(Lista, PuntosScaloneta) :-
    findall(Puntos, (member(Jugador,Lista), puntajeJugador(Jugador, Puntos)), ListaPuntaje),
    sum_list(ListaPuntaje, PuntosScaloneta).

puntajeTotalEquipo(Puntos):-
    findall(Jugador, puntosJugador(_, Punto), Puntajes),
    sum_list(Puntajes, Puntos).

% Punto 3: Puntaje total
% Dada una lista de jugadores, queremos saber cuantos puntos sumaron todos.