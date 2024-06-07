% mi_primer_programa.pl
% Este es un comentario

% Definimos algunos hechos
hombre(lucio).
hombre(valen).
mujer(zoe).

% Definimos una regla
persona(X) :- hombre(X).
persona(X) :- mujer(X).
