% Atracciones tranquilas (toda la familia o exclusivas para chicos)
atraccionTranquila(autitos_chocadores, adultos_y_chicos).
atraccionTranquila(casa_embrujada, adultos_y_chicos).
atraccionTranquila(laberinto, adultos_y_chicos).
atraccionTranquila(tobogan, chicos).
atraccionTranquila(calesita, chicos).

% Atracciones intensas
atraccionIntensa(barco_pirata, 14).
atraccionIntensa(tazas_chinas, 6).
atraccionIntensa(simulador_3d, 2).

% Montañas rusas
montanaRusa(abismo_mortal_recargada, 3, 134).  % Duración en segundos: 2:14
montanaRusa(paseo_por_el_bosque, 0, 45).

% Atracciones acuáticas
atraccionAcuatica(el_torpedo_salpicon).
atraccionAcuatica(espero_que_hayas_traido_una_muda_de_ropa).

% Visitantes

visitante(eusebio, 80, 3000, 50, 0, viejitos).
visitante(carmela, 80, 0, 0, 25, viejitos).

visitante(valentin, 25, 5000, 20, 10, solo).
visitante(sofia, 30, 2000, 0, 0, solo).

% Atracciones de Comida

puestoComida(hamburguesas, 2000).
puestoComida(panchitos, 1500).
puestoComida(lomito, 2500).

% PUNTO 2

estadoBienestar(Visitante, felicidadPlena):-
    visitante(Visitante,_,_, 0, 0,_).

estadoBienestar(Visitante, Estado):-
    visitante(Visitante,_,_, Hambre, Aburrimiento,_).
