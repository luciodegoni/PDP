/* Modelar lo necesario para representar los jugadores, las civilizaciones y las tecnologías, de la forma más conveniente para resolver los siguientes puntos. Incluir los siguientes ejemplos.
Ana, que juega con los romanos y ya desarrolló las tecnologías de herrería, forja, emplumado y láminas.
Beto, que juega con los incas y ya desarrolló herrería, forja y fundición.
Carola, que juega con los romanos y sólo desarrolló herrería.
Dimitri, que juega con los romanos y ya desarrolló herrería y fundición.
Elsa no juega esta partida. */


% Tecnologías
tecnologia(herreria).
tecnologia(forja).
tecnologia(emplumado).
teconologia(laminas).
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

/*Saber si un jugador es experto en metales, que sucede cuando desarrolló las tecnologías de herrería, forja y o bien desarrolló fundición o bien juega con los romanos.
En los ejemplos, Ana y Beto son expertos en metales, pero Carola y Dimitri no. */

expertoEnMetales(Jugador) :-
    desarrollo(Jugador, herreria),
    desarrollo(Jugador, forja),
    desarrollo(Jugador, fundicion).

expertoEnMetales(Jugador) :-
    desarrollo(Jugador, herreria),
    desarrollo(Jugador, forja),
    juega(Jugador, romanos).

/*Saber si una civilización es popular, que se cumple cuando la eligen varios jugadores (más de uno).
En los ejemplos, los romanos es una civilización popular, pero los incas no. */

popular(Civilizacion) :-
    juega(Jugador1, Civilizacion),
    juega(Jugador2, Civilizacion),
    Jugador1 \= Jugador2.

/*Saber si una tecnología tiene alcance global, que sucede cuando a nadie le falta desarrollarla.
En los ejemplos, la herrería tiene alcance global, pues Ana, Beto, Carola y Dimitri la desarrollaron.*/

alcanceGlobal(Tecnologia) :-
    desarrollo(ana, Tecnologia),
    desarrollo(beto, Tecnologia),
    desarrollo(carola, Tecnologia),
    desarrollo(dimitri, Tecnologia).

/*Saber cuándo una civilización es líder. Se cumple cuando esa civilización alcanzó todas las tecnologías que alcanzaron las demás. 
(Una civilización alcanzó una tecnología cuando algún jugador de esa civilización la desarrolló).
En los ejemplos, los romanos es una civilización líder pues entre Ana y Dimitri, que juegan con romanos, ya tienen todas las tecnologías que se alcanzaron.*/

alcanzoTecnologia(Civilizacion, Tecnologia):-
    desarrollo(_,Tecnologia),
    juega(_,Civilizacion).
alcanzoTodasLasTecnologias(Civilizacion) :-
     juega(_, Civilizacion),
     forall(tecnologia(T), alcanzoTecnologia(Civilizacion, T)).
    

