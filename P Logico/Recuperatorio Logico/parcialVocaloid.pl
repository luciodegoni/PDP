% vocaloid(nombre, cancion(nombre, duracion)).

vocaloid(megurineLuka, cancion(nightFever, 4)).
vocaloid(megurineLuka, cancion(foreverYoung, 5)).
vocaloid(hatsuneMiku, cancion(tellYourWorld, 4)).
vocaloid(gumi, cancion(foreverYoung, 6)).
vocaloid(gumi, cancion(tellYourWorld, 5)).
vocaloid(seeU, cancion(novemberRain, 6)).
vocaloid(seeU, cancion(nightFever, 5)).


esNovedoso(Cantante):-
    sabeDosCanciones(Cantante),
    duracionTotal(Cantante, Tiempo),
    Tiempo < 15. 

sabeDosCanciones(Cantante):-
    vocaloid(Cantante, Cancion1),
    vocaloid(Cantante, Cancion2),
    Cancion1 \= Cancion2.

duracionTotal(Cantante, TiempoTotal):-
    findall(Tiempo, tiempoCancion(Cantante, Tiempo), Tiempos),
    sum_list(Tiempos, TiempoTotal).
    

tiempoCancion(Cantante, TiempoCancion):- vocaloid(Cantante, cancion(_, TiempoCancion)).

esAcelerado(Cantante):-
    vocaloid(Cantante, _),
    not((vocaloid(Cantante, cancion(_, Duracion)), Duracion > 4)). 

% concierto (nombre, pais, fama, tipoConcierto)

concierto(mikuExpo, eeuu, 2000, gigante(2, 6)).
concierto(magicalMirai, japon, 3000, gigante(3,10)).
concierto(vocalektVisions, eeuu, 1000, mediano(9)).
concierto(mikuFest, argentina, 100, diminuto(4)).

puedeParticipar(hatsuneMiku, Concierto):-
    concierto(Concierto,_, _, _).

puedeParticipar(Cantante, Concierto):-
    vocaloid(Cantante, _),
    Cantante \= hatsuneMiku,
    concierto(Concierto,_,_, Requisitos),
    cumplaRequisitos(Cantante, Requisitos).

cumplaRequisitos(Cantante, gigante(CantCanciones, DuracionTotal)):-
    cantidadTotalCanciones(Cantante, CancionesCantante),
    CancionesCantante > CantCanciones,
    duracionTotal(Cantante, TiempoTotal),
    TiempoTotal > DuracionTotal.

cumplaRequisitos(Cantante, mediano(Duracion)):-
        duracionTotal(Cantante, Tiempo),
        Duracion < Tiempo.
    
cumplaRequisitos(Cantante, diminuto(Duracion)):-
        vocaloid(Cantante, cancion(_, Tiempo)),
        Tiempo > Duracion.

cantidadTotalCanciones(Cantante, CancionesTotales):-
    findall(Cancion, vocaloid(Cantante, Cancion), Canciones),
    length(Canciones, CancionesTotales).


nivelDeFama(Cantante, NivelFama):-
    vocaloid(Cantante, _),
    findall(Fama, (puedeParticipar(Cantante, Concierto), concierto(Concierto,_, Fama,_)), ListaFamas),
    sum_list(ListaFamas, NivelFama).    

famaTotal(Cantante, FamaTotal):-
    nivelDeFama(Cantante, NivelFama),
    cantidadTotalCanciones(Cantante, CancionesTotales),
    FamaTotal is (NivelFama * CancionesTotales).

masFamoso(Cantante):-
    famaTotal(Cantante, FamaTotal),
    forall(famaTotal(_, Fama), FamaTotal >= Fama).

conoceA(megurineLuka, hatsuneMiku).
conoceA(megurineLuka, gumi).
conoceA(gumi, seeU).
conoceA(seeU, kaito).

conocido(Cantante, OtroCantante):- conoceA(Cantante, OtroCantante).
conocido(Cantante, UnCantante):- 
    conoceA(Cantante, OtroCantante),
    conocido(OtroCantante, UnCantante).

unicoParticipante(Cantante, Concierto):-
    puedeParticipar(Cantante, Concierto),
    not(conocido(Cantante, OtroCantante)),
    puedeParticipar(OtroCantante, Concierto).