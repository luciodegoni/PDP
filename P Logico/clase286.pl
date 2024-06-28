
% Manipulación de listas:
% pais(america, [argentina, brasil, uruguay]).
% pais(africa, [senegal, etiopia, sudafrica, angola]).
pais(america,argentina).
pais(america,brasil).
pais(america,uruguay).
pais(africa,senegal).
pais(africa,etiopia).
pais(africa,sudafrica).
pais(africa,angola).

continente(america).
continente(africa).

cuantosPaises(Continente, Cantidad) :-
    paises(Continente, Paises),
    length(Paises, Cantidad).

paises(Continente, Paises):-
    continente(Continente),
    findall(Pais, pais(Continente, Pais), Paises).

todosLosPaises(Paises):-
    findall(Pais, pais(_, Pais), Paises).

/* Ej consulta: 
   cuantosPaises(america, Cantidad).
   Cantidad = 3.

   cuantosPaises(Continente, 4).        
   Continente = africa. */

%Predicados útiles para listas

% sumlist([3,4,5], X).  averigua la suma de los elementos de una lista, o los verifica

/*  sumlist([3,4,5], 12).
    true. 
    
    sumlist([3,4,5], X).
    X = 12.
*/

% member(Num,[3,4,5]). averigua si el elemento que le pasamos está en la lista, o nos da los elementos.

 /* member(3, [3,4,5]).
   true. 
   
   member(X, [3,4,5]).
   3;
   4;
   5.
*/
/*
append([1,2,3,4],[5,6,7,8],[1,2,3,4,5,6,7,8]) relaciona dos listas con la lista concatenada

append([1,2,3,4],[5,6,7,8],[1,2,3,4,5,6,7,8]). 
true.

append([1,2,3,4],[5,6,7,8], L).                
L = [1, 2, 3, 4, 5, 6, 7, 8].
*/

%uso listas si es solo impredescible (si quiero usar length o suma)

cabeza([X|Xs], X). 


% Functores
% En vez de modelar: persona(juan,bsas, 20, 1, 2000).
% Modelo persona (juan,bsas, fecha(20,1,2000)).
