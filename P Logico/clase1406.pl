use_module(paises).
use_module(ocupacion).
use_module(clase).

% destruir al ejército amarillo
destruyeAmarillo(Color):-
    not(ocupa(Color,_,_)).

% conquistar Asia
conquistar(Continente,Color):-
    pais(_,Continente),
    ocupa(Color,_,_),
    forall(pais(Pais,Continente), ocupa(Pais,Color,_)).

% conquistar Sudamérica y África
% conquistar Europa y dos países de Oceanía
% proponer un objetivo extra, que no sea ni de conquista ni de destrucción.
% (desafío) conquistar 50 países