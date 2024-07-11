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
tecnologia(laminas).

expertoEnMetales(Jugador) :-
    desarrollo(Jugador, herreria),
    desarrollo(Jugador, forja),
    desarrollo(Jugador, fundicion).
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

     
% No se puede ganar la guerra sin soldados. Las unidades que existen son los campeones (con vida de 1 a 100), los jinetes (que los puede haber a caballo o a camello) 
% y los piqueros, que tienen un nivel de 1 a 3, y pueden o no tener escudo.  
% Modelar lo necesario para representar las distintas unidades de cada jugador de la forma más conveniente para resolver los siguientes puntos. Incluir los siguientes ejemplos:

% Ana tiene un jinete a caballo, un piquero con escudo de nivel 1, y un piquero sin escudo de nivel 2.
tieneUnidad(ana, unidad(jinete(caballo))).
tieneUnidad(ana, unidad(piquero(nivel(1), conEscudo))).
tieneUnidad(ana, unidad(piquero(nivel(2),sinEscudo))).

% Beto tiene un campeón de 100 de vida, otro de 80 de vida, un piquero con escudo nivel 1 y un jinete a camello.

tieneUnidad(beto,unidad(campeon(100))).
tieneUnidad(beto,unidad(campeon(80))).
tieneUnidad(beto,unidad(piquero(nivel(1), conEscudo))).
tieneUnidad(beto,jinete(camello(80))).

% Carola tiene un piquero sin escudo de nivel 3 y uno con escudo de nivel 2.
tieneUnidad(carola,unidad(piquero(nivel(3), sinEscudo))).
tieneUnidad(carola,unidad(piquero(nivel(2), conEscudo))).
% Dimitri no tiene unidades.

% Conocer la unidad con más vida que tiene un jugador, teniendo en cuenta que:
% Los jinetes a camello tienen 80 de vida y los jinetes a caballo tienen 90.
% Cada campeón tiene una vida distinta.
% Los piqueros sin escudo de nivel 1 tienen vida 50, los de nivel 2 tienen vida 65 y los de nivel 3 tienen 70 de vida.
% Los piqueros con escudo tienen 10% más de vida que los piqueros sin escudo.

vidaUnidad(unidad(jinete(caballo)), 90).
vidaUnidad(unidad(jinete(camello)), 80).
vidaUnidad(unidad(campeon(Vida)), Vida).
vidaUnidad(unidad(piquero(nivel(1), sinEscudo)), 50).
vidaUnidad(unidad(piquero(nivel(2), sinEscudo)), 65).
vidaUnidad(unidad(piquero(nivel(3), sinEscudo)), 70).
vidaUnidad(unidad(piquero(nivel(N), conEscudo)), Vida) :-
    vidaUnidad(piquero(nivel(N), sinEscudo), VidaSinEscudo),
    Vida is VidaSinEscudo * 1.1.

vida(Jugador, Unidad, Vida):-
    tieneUnidad(Jugador, Unidad),
    vidaUnidad(Unidad, Vida).

unidadConMasVida(Jugador, Unidad) :-
    tieneUnidad(Jugador, Unidad),
    vida(Jugador, Unidad, Vida1),
    forall(
        (tieneUnidad(Jugador, Uni), vida(Jugador, Uni, Vida2)),
            Vida1 >= Vida2
        ).


% unidadConMasVida(Jugador, Unidad, VidaMaxima):-
%     findall(V, vida(Jugador,_,V), Vidas),
%     max_member(VidaMaxima, Vidas),
%     vida(Jugador, Unidad, VidaMaxima).

% Queremos saber si una unidad le gana a otra. Las unidades tienen una ventaja por tipo sobre otras. Cualquier jinete le gana a cualquier campeón, 
% cualquier campeón le gana a cualquier piquero y cualquier piquero le gana a cualquier jinete, pero los jinetes a camello le ganan a los a caballo. 
% En caso de que no exista ventaja entre las unidades, se compara la vida (el de mayor vida gana). 
% Este punto no necesita ser inversible.
% Por ejemplo, un campeón con 95 de vida le gana a otro con 50, pero un campeón con 100 de vida no le gana a un jinete a caballo.

ventaja(jinete(_), campeon(_)).
ventaja(campeon(_), piquero(_, _)).
ventaja(piquero(_,_), jinete(_)).
ventaja(jinete(camello), jinete(caballo)).

unidadGanadora(Unidad1, Unidad2):-
    ventaja(Unidad1, Unidad2),
    ventaja(Unidad2, Unidad1),
    vida(_, Unidad1, Vida1),
    vida(_, Unidad2, Vida2),
    Vida1 > Vida2. 

% Saber si un jugador puede sobrevivir a un asedio. Esto ocurre si tiene más piqueros con escudo que sin escudo.

sobreviveAsedio(Jugador) :-
    findall(_, tieneUnidad(Jugador, unidad(piquero(_, conEscudo))), PiquerosConEscudo),
    findall(_, tieneUnidad(Jugador, unidad(piquero(_, sinEscudo))), PiquerosSinEscudo),
    length(PiquerosConEscudo, NConEscudo),
    length(PiquerosSinEscudo, NSinEscudo),
    NConEscudo > NSinEscudo.

% Arbol dependencias tecnologia
depende(emplumado,herreria).
depende(punzon, emplumado).

depende(forja,herreria).
depende(fundicion,forja).
depende(horno,fundicion).

depende(laminas,herreria).
depende(malla,laminas).
depende(placas,malla).

depende(collera,molino).
depende(arado,collera).

sindependencia(herreria).
sindependencia(molino).

desarolloDependencias(J,T) :- sindependencia(T), !.
desarolloDependencias(J,T) :- depende(T,T2), desarrollo(J,T2), desarolloDependencias(J,T2).

puedeDesarrollar(J,T) :- juega(J,_), tecnologia(T), not(desarrollo(J,T)), desarolloDependencias(J,T).



    