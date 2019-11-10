fake_nombre(X):-N1 is random(3)+1, N2 is random(2)+1, fake_nombrePila(N1, Y1), fake_apellido(N2, Y2), append(Y1, Y2, Y3), concatenarListaStrings(Y3, X).

fake_nombrePila(0, []).
fake_nombrePila(N, [P|X]):-  A is N-1, repeat, nombre(P), fake_nombrePila(A, X), is_set([P|X]),!.

fake_apellido(0, []).
fake_apellido(N, [P|X]):-  A is N-1, repeat, apellido(P), fake_apellido(A, X), is_set([P|X]), !.

concatenarListaStrings([Y],Y):-!.
concatenarListaStrings([Y1|Ys], S):- concatenarListaStrings(Ys, P), string_concat(" ", P, Aux), string_concat(Y1, Aux, S).

%CUANDO TOCA "PB" EL PROGRAMA TIRA UNA EXCEPCION
fake_direccion(X):- fake_piso(S3), S3=\=41, !, number_string(S3, P0), fake_calle(S1), fake_numero_casa(S2), number_string(S2, P1),
					fake_numero_departamento(S4), number_string(S4, P2), string_concat(S1, " ", Aux), string_concat(Aux, P1 , Aux1),
					string_concat(Aux1, " Piso:", Aux2), string_concat(Aux2, P0, Aux3), string_concat(Aux3, " Dpto:", Aux4), string_concat(Aux4, P2, X).
					
fake_direccion(X):- fake_calle(S1), fake_numero_casa(S2), number_string(S2, P1),
					fake_numero_departamento(S4), number_string(S4, P2), string_concat(S1, " ", Aux), string_concat(Aux, P1 , Aux1),
					string_concat(Aux1, " Piso:", Aux2), string_concat(Aux2, "pb", Aux3), string_concat(Aux3, " Dpto:", Aux4), string_concat(Aux4, P2, X).

fake_calle(X):- calles(P), random_member(X, P).
fake_numero_casa(X):- random(1000,15001,X).
fake_piso(X):- X is random(41)+1.

fake_numero_departamento(X):- X is random(20)+1.


calles(["San Martin", "3 de Febrero", "Obispo Gelabert", "Av. Freyre", "Bv. Pellegrini"]).

nombres(["Juan","Maria","Pedro","Jesus","Eric","Belen","Tamara"]).
nombre(X):- nombres(P), random_member(X,P).

apellidos(["Menem", "Perez", "Fernandez", "Rodriguez", "Nisman"]).
apellido(X):- apellidos(P), random_member(X,P).

ciudad("Rosario").
ciudad("Lima").
ciudad("Santiago").
ciudad("Puerto Montt").
ciudad("Santa Cruz").

pais("Argentina").
pais("Peru").
pais("Cuba").
pais("Antigua y Barbuda").
pais("Venezuela").

provincia("San Luis").
provincia("Mendoza").
provincia("Entre Rios").
provincia("Cordoba").
provincia("Santa Fe").

nombre_color(rojo).
nombre_color(amarillo).
nombre_color(verde).
nombre_color(azul).
nombre_color(negro).

moneda_sigla(usd).
moneda_sigla(ars).
moneda_sigla(eur).
moneda_sigla(pen).
moneda_sigla(clp).

moneda_nombre("Dolar estadounidense").
moneda_nombre("Peso argentino").
moneda_nombre("Euro").
moneda_nombre("Peso peruano").
moneda_nombre("Peso chileno").

dia_de_semana(lunes).
dia_de_semana(martes).
dia_de_semana(miercoles).
dia_de_semana(jueves).
dia_de_semana(viernes).
dia_de_semana(sabado).
dia_de_semana(domingo).
