use_module(paises).
usemodule(ocupacion).

% Definición de sonLimitrofes
sonLimitrofes(P1, P2) :- limita(P1, P2).
sonLimitrofes(P1, P2) :- limita(P2, P1).

% Paises que limitan con paises de otro continente (\= es el distinto)
limitaConContinentes(P1, P2) :-
    pais(P1, C1),
    pais(P2, C2),
    C1 \= C2,
    sonLimitrofes(P1, P2).

    

% Predicado puede_atacar/1 que determine si un país tiene más ejércitos que uno de sus países limítrofes que sea de otro color.
% Un ejercito esFuerte/1 si ninguno de sus países está complicado.

% Predicado que me diga los enemigos de un país, es decir sus limítrofes que no tengan el mismo color.

esEnemigo(Pais, OtroPais) :-
    sonLimitrofes(Pais, OtroPais),
    ocupa(Color1, Pais, _),
    ocupa(Color2, OtroPais, _),
    Color1 \= Color2.

% Predicado complicado/1 verifica si un país está "complicado", es decir, 
% si tiene dos países limítrofes del mismo color y la suma de los ejércitos de ambos países es al menos 5.

esComplicado(Paism OtroPais):-
    sonLimitrofes(Pais1, Pais2),
    sonLimitrofes(Pais1, Pais3),
    ocupa(Pais1, Color, Ejercitos1),
    ocupa(Pais2, Color, Ejercito2),
    ocupa(Pais3, Color, Ejercito3)
    Ejercitos1 + Ejercito2 >= 5
