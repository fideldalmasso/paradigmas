
fake_nombrePila(0, []).
fake_nombrePila(N, [P|X]):-  repeat,A is N-1, nombre(P), fake_nombrePila(A, X), not(memberchk(P,X)).
fake_apellido(0, []).
fake_apellido(N, [P|X]):-  A is N-1, apellido(P), fake_apellido(A, X), not(memberchk(P,X)).


fake_numero_casa(X):- random(1000,15001,X).
fake_piso(X):- X is random(40)+1.
fake_numero_departamento(X):- X is random(20)+1.


calle("San Martin").
calle("3 de Febrero").
calle("Obispo Gelabert").
calle("Av. Freyre").
calle("Bv. Pellegrini").


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
