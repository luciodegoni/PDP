% que permita relacionar a un personaje que sea el héroe del episodio con
%  su correspondiente villano, junto con un personaje extra que le aporta mística y 
%  un dispositivo especial que resulta importante para la trama.

% Las condiciones que deben cumplirse simultáneamente son las siguientes:
% No se quiere innovar tanto, los personajes deben haber aparecido en alguno de los episodios anteriores
% y obviamente ser diferentes.
% Para mantener el espíritu clásico, el héroe tiene que ser un jedi 
% (un maestro que estuvo alguna vez en el lado luminoso) que nunca se haya pasado al lado oscuro. 
% El villano debe haber estado en más de un episodio y 
% tiene que mantener algún rasgo de ambigüedad, por lo que se debe garantizar que haya aparecido del 
% lado luminoso en algún episodio y del lado oscuro en el mismo episodio o en un episodio posterior.  
% El extra tiene que ser un personaje de aspecto exótico para mantener la estética de la saga. 
% Tiene que tener un vínculo estrecho con los protagonistas, que consiste en que haya estado junto al heroe
% o al villano en todos los episodios en los que dicho extra apareció. Se considera exótico
% a los robots que no tengan forma de esfera y a los seres de gran tamaño (mayor a 15) o 
% de especie desconocida.
% El dispositivo tiene que ser reconocible por el público, por lo que tiene que ser un elemento
%  que haya estado presente en muchos episodios (3 o más)

%Conocimientos:

%apareceEn( Personaje, Episodio, Lado de la luz).
apareceEn( luke, elImperioContrataca, luminoso).
apareceEn( luke, unaNuevaEsperanza, luminoso).
apareceEn( vader, unaNuevaEsperanza, oscuro).
apareceEn( vader, laVenganzaDeLosSith, luminoso).
apareceEn( vader, laAmenazaFantasma, luminoso).
apareceEn( c3po, laAmenazaFantasma, luminoso).
apareceEn( c3po, unaNuevaEsperanza, luminoso).
apareceEn( c3po, elImperioContrataca, luminoso).
apareceEn( chewbacca, elImperioContrataca, luminoso).
apareceEn( yoda, elAtaqueDeLosClones, luminoso).
apareceEn( yoda, laAmenazaFantasma, luminoso).

%Maestro(Personaje)
maestro(luke).
maestro(leia).
maestro(vader).
maestro(yoda).
maestro(rey).
maestro(duku).

%caracterizacion(Personaje,Aspecto).
%aspectos:
% ser(Especie,Tamaño)
% humano
% robot(Forma)
caracterizacion(chewbacca,ser(wookiee,10)).
caracterizacion(luke,humano).
caracterizacion(vader,humano).
caracterizacion(yoda,ser(desconocido,5)).
caracterizacion(jabba,ser(hutt,20)).
caracterizacion(c3po,robot(humanoide)).
caracterizacion(bb8,robot(esfera)).
caracterizacion(r2d2,robot(secarropas)).

%elementosPresentes(Episodio, Dispositivos)
elementosPresentes(laAmenazaFantasma, [sableLaser]).
elementosPresentes(elAtaqueDeLosClones, [sableLaser, clon]).
elementosPresentes(laVenganzaDeLosSith, [sableLaser, mascara, estrellaMuerte]).
elementosPresentes(unaNuevaEsperanza, [estrellaMuerte, sableLaser, halconMilenario]).
elementosPresentes(elImperioContrataca, [mapaEstelar, estrellaMuerte] ).


%precede(EpisodioAnterior,EpisodioSiguiente)
precedeA(laAmenazaFantasma,elAtaqueDeLosClones).
precedeA(elAtaqueDeLosClones,laVenganzaDeLosSith).
precedeA(laVenganzaDeLosSith,unaNuevaEsperanza).
precedeA(unaNuevaEsperanza,elImperioContrataca).

sonDistintos(Heroe, Villano, Extra):-
    Heroe \= Villano,
    Heroe \= Extra,
    Villano \= Extra.
epAnterior(Episodio, EpisodioPrevio):-
    precedeA(EpisodioPrevio, Episodio).
epAnterior(Episodio, EpisodioPrevio):-
    precedeA(EpisodioAnterior, Episodio),
    epAnterior(EpisodioAnterior, EpisodioPrevio).
    
esJedi(Heroe):-
    maestro(Heroe),
    apareceEn(Heroe,_, luminoso),
    not(apareceEn(Heroe, _, oscuro)).

estuvoEnMasDeUnEp(Villano):-
    apareceEn(Villano,Ep1,_),
    apareceEn(Villano,Ep2,_),
    Ep1 \= Ep2.

tieneRasgoAmbiguo(Villano):-
    apareceEn(Villano,Ep1, luminoso),
    apareceEn(Villano,Ep2, oscuro),
    epAnterior(Ep2,Ep1).

tieneRasgoAmbiguo(Villano):-
    apareceEn(Villano,Ep, luminoso),
    apareceEn(Villano,Ep, oscuro).
    
esExotico(Extra):-
    caracterizacion(Extra, robot(Forma)),
    Forma \= esfera.
esExotico(Extra):-
    caracterizacion(Extra,ser(_,T)),
    T> 15.

esExotico(Extra):-
    caracterizacion(Extra,ser(desconocido,_)).

siempreAcompaniado(Extra, Heroe, Villano):-
    apareceEn(Extra,_,_),
    apareceEn(Heroe,_,_),
    apareceEn(Villano,_,_),
    forall(apareceEn(Extra, Episodio, _), aparececioAlguno(Episodio,Heroe, Villano)).

aparececioAlguno(Episodio,Heroe,_):-
    apareceEn(Heroe, Episodio, _).
aparececioAlguno(Episodio,_, Villano):-
    apareceEn(Villano, Episodio, _).
    

esReconocible(Dispositivo):-
    elementosPresentes(_, Elementos),
    member(Dispositivo, Elementos),
    findall(Ep, elementosPresentes(Ep, Dispositivo), ListaEp),
        member((Dispositivo, ListaEp), Episodios),
    length(Episodios,Tam),
    Tam >= 3.
nuevoEpisodio(Heroe, Villano, Extra, Dispositivo) :-
    sonDistintos(Heroe, Villano, Extra),
    esJedi(Heroe),
    estuvoEnMasDeUnEp(Villano),
    tieneRasgoAmbiguo(Villano),
    esExotico(Extra),
    siempreAcompaniado(Extra, Heroe, Villano),
    esReconocible(Dispositivo).
    
 