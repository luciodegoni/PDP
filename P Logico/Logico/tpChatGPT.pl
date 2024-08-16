% Tecnologías
tecnologia(herreria).
tecnologia(forja).
tecnologia(emplumado).
tecnologia(laminas).
tecnologia(fundicion).

% Relación entre jugadores y sus tecnologías desarrolladas
desarrollo(ana, herreria).
desarrollo(ana, forja).
desarrollo(ana, emplumado).
desarrollo(ana, laminas).

desarrollo(beto, herreria).
desarrollo(beto, forja).
desarrollo(beto, fundicion).

desarrollo(carola, herreria).

desarrollo(dimitri, herreria).
desarrollo(dimitri, fundicion).

juega(ana, romanos).
juega(beto, incas).
juega(carola, romanos).
juega(dimitri, romanos).

% Experto en metales
expertoEnMetales(Jugador) :-
    desarrollo(Jugador, herreria),
    desarrollo(Jugador, forja),
    (   desarrollo(Jugador, fundicion)
    ;   juega(Jugador, romanos)
    ).

% Civilización popular
popular(Civilizacion) :-
    juega(Jugador1, Civilizacion),
    juega(Jugador2, Civilizacion),
    Jugador1 \= Jugador2.

% Tecnología con alcance global
alcanceGlobal(Tecnologia) :-
    forall(juega(Jugador, _), desarrollo(Jugador, Tecnologia)).

% Civilización líder
alcanzoTecnologia(Civilizacion, Tecnologia) :-
    juega(Jugador, Civilizacion),
    desarrollo(Jugador, Tecnologia).

alcanzoTodasLasTecnologias(Civilizacion) :-
    forall(tecnologia(Tecnologia), alcanzoTecnologia(Civilizacion, Tecnologia)).

% Unidades
tieneUnidad(ana, unidad(jinete(caballo))).
tieneUnidad(ana, unidad(piquero(nivel(1), conEscudo))).
tieneUnidad(ana, unidad(piquero(nivel(2), sinEscudo))).

tieneUnidad(beto, unidad(campeon(100))).
tieneUnidad(beto, unidad(campeon(80))).
tieneUnidad(beto, unidad(piquero(nivel(1), conEscudo))).
tieneUnidad(beto, unidad(jinete(camello))).

tieneUnidad(carola, unidad(piquero(nivel(3), sinEscudo))).
tieneUnidad(carola, unidad(piquero(nivel(2), conEscudo))).

% Vida de unidades
vidaUnidad(unidad(jinete(caballo)), 90).
vidaUnidad(unidad(jinete(camello)), 80).
vidaUnidad(unidad(campeon(Vida)), Vida).
vidaUnidad(unidad(piquero(nivel(1), sinEscudo)), 50).
vidaUnidad(unidad(piquero(nivel(2), sinEscudo)), 65).
vidaUnidad(unidad(piquero(nivel(3), sinEscudo)), 70).
vidaUnidad(unidad(piquero(nivel(N), conEscudo)), Vida) :-
    vidaUnidad(unidad(piquero(nivel(N), sinEscudo)), VidaSinEscudo),
    Vida is VidaSinEscudo * 1.1.

vida(Jugador, Unidad, Vida) :-
    tieneUnidad(Jugador, Unidad),
    vidaUnidad(Unidad, Vida).

unidadConMasVida(Jugador, Unidad) :-
    tieneUnidad(Jugador, Unidad),
    vida(Jugador, Unidad, Vida1),
    forall(
        (tieneUnidad(Jugador, OtraUnidad), vida(Jugador, OtraUnidad, Vida2)),
        Vida1 >= Vida2
    ).

% Comparación de unidades
ventaja(jinete(_), campeon(_)).
ventaja(campeon(_), piquero(_, _)).
ventaja(piquero(_,_), jinete(_)).
ventaja(jinete(camello), jinete(caballo)).

unidadGanadora(Unidad1, Unidad2) :-
    ventaja(Unidad1, Unidad2), !.

unidadGanadora(Unidad1, Unidad2) :-
    \+ ventaja(Unidad2, Unidad1),
    vida(_, Unidad1, Vida1),
    vida(_, Unidad2, Vida2),
    Vida1 > Vida2.

    sobreviveAsedio(Jugador) :-
        % Contar todos los piqueros con escudo que tiene el jugador
        findall(_, tieneUnidad(Jugador, unidad(piquero(_, conEscudo))), PiquerosConEscudo),
        % Contar todos los piqueros sin escudo que tiene el jugador
        findall(_, tieneUnidad(Jugador, unidad(piquero(_, sinEscudo))), PiquerosSinEscudo),
        % Obtener la longitud de cada lista
        length(PiquerosConEscudo, NConEscudo),
        length(PiquerosSinEscudo, NSinEscudo),
        % Comparar las longitudes para determinar si sobrevive al asedio
        NConEscudo > NSinEscudo.
    

