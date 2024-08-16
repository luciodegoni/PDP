pokemon(pikachu, tipo(electrico)).
pokemon(charizard, tipo(fuego)).
pokemon(venusaur, tipo(planta)).
pokemon(blastoise, tipo(agua)).
pokemon(snorlax, tipo(normal)).
pokemon(rayquaza, tipo(dragon)).
pokemon(rayquaza, tipo(volador)).

tiene(ash, pikachu).
tiene(ash, charizard).
tiene(brock, snorlax).
tiene(misty, blastoise).
tiene(misty, venusaur). 
tiene(misty, arceus).

esMultiple(Pokemon):-
    pokemon(Pokemon, tipo(Atributo1)),
    pokemon(Pokemon, tipo(Atributo2)),
    Atributo1 \= Atributo2.

esLegendario(Pokemon):-
    esMultiple(Pokemon),
    not(tiene(_, Pokemon)).

unicoEnSuTipo(Pokemon):-
    pokemon(Pokemon, Tipo),
    not((pokemon(OtroPokemon, Tipo), Pokemon \= OtroPokemon)).

esMisterioso(Pokemon):-
    unicoEnSuTipo(Pokemon).

esMisterioso(Pokemon):-
    not(tiene(_, Pokemon)).


%%%%%%%%%%%%%%%%%%%% Parte 2 %%%%%%%%%%%%%%%%%%%%
tipoBasico(fuego).
tipoBasico(agua).
tipoBasico(planta).
tipoBasico(normal).

movimiento(pikachu, fisico(mordedura, 95)).
movimiento(pikachu, especial(impactrueno, electrico, 40)).

movimiento(charizard, especial(garraDragon, dragon, 100)).
movimiento(charizard, fisico(mordedura, 95)).

movimiento(blastoise, defensivo(proteccion, 10)).
movimiento(blastoise, fisico(placaje, 50)).

movimiento(arceus, especial(impactrueno, electrico, 40)).
movimiento(arceus, especial(garraDragon, dragon, 100)).
movimiento(arceus, defensivo(proteccion, 10)).
movimiento(arceus, fisico(placaje, 50)).
movimiento(arceus, defensivo(alivio, 100)).

danioAtaque(fisico(_, Potencia), Potencia).
danioAtaque(defensivo(_, _), 0).
danioAtaque(especial(_, Tipo, Potencia), Danio):-
    multiplicadorTipo(Tipo, Multiplicador),
    Danio is Potencia * Multiplicador. 

multiplicadorTipo(Tipo, 1.5):-
    tipoBasico(Tipo).

multiplicadorTipo(dragon, 3).
multiplicadorTipo(_, 1).

danioAtaquePokemon(Pokemon, Danio):-
    movimiento(Pokemon, Mov), 
    danioAtaque(Mov, Danio).

    
capacidadOfensiva(Pokemon, Ofensiva):-
    pokemon(Pokemon,_),
    findall(Ataque, danioAtaquePokemon(Pokemon, Ataque), ListaDanios),
    sum_list(ListaDanios, Ofensiva).

esPicante(Entrenador):-
    tiene(Entrenador, _),
    forall(tiene(Entrenador, Pokemon), picante(Pokemon)).

picante(Pokemon):-
    capacidadOfensiva(Pokemon, Capacidad),
    Capacidad > 200.
picante(Pokemon):-
    esMisterioso(Pokemon).

    