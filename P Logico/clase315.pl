esHombre(socrates).
esHombre(juanPerez).
esMortal(Hombre).

# Hombre= socrates, juanPerez

/* Otra forma es % si esHombre (Alguien) :- esHombre (Alguien).
Es el equivalente a decir Si.. Entonces.. */

clima(bsas,lluvia,10).
clima(cordoba,sol,23).
clima(rosario,lluvia,100).

seRego(pasto).
seRego(vereda).

# seMojo(Lugar):-seRego(Lugar).
# seMojo(Lugar):-clima(Ciudad,lluvia, Cantidad).

ubicacion(pasto,bsas).
ubicacion(vereda,cordoba).
ubicacion(calle,rosario).

alAireLibre(pasto).
alAireLibre(vereda).
alAireLibre(calle).

seMojo(Lugar):-
alAireLibre(Lugar),
ubicacion(Lugar,Ciudad),
clima(Ciudad,lluvia,Cantidad),
Cantidad >20.

/* Ser Buen Ingeniero
    Titulo
    Sabe un Buen Idioma
    Tiene PLata 
*/

esBuenIngeniero(Persona):-
    estaRecibido(Persona),
    sabeIdioma(Persona, Idioma),
    tienePlata(Persona, Cantidad), 
    Cantidad > 1000.

manejaIdioma (Persona, ingles, espaniol).


estaRecibido(tin).
sabeIdioma(tin, aleman).
sabeIdioma (tin, ingles).
tienePlata(tin, 3000).
