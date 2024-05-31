% mi_primer_programa.pl
% Este es un comentario

% Definimos algunos hechos
hombre(juan).
hombre(pedro).
mujer(maria).

% Definimos una regla
persona(X) :- hombre(X).
persona(X) :- mujer(X).
