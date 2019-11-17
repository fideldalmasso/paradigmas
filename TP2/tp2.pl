nombre("Maria").
nombre("Juan").
nombre("Martin").
nombre("Belen").
nombre("Tamara").

apellido("Nisman").
apellido("Menem").
apellido("Ramirez").
apellido("Perez").
apellido("Montana").

calle("San Martin").
calle("3 de Febrero").
calle("Obispo Gelabert").
calle("Av. Freyre").
calle("Bv. Pellegrini").

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

moneda([usd,"Dolar estadounidense"]).
moneda([ars,"Peso argentino"]).
moneda([eur,"Euro"]).
moneda([pen,"Peso peruano"]).
moneda([clp,"Peso chileno"]).

dia_de_semana(lunes).
dia_de_semana(martes).
dia_de_semana(miercoles).
dia_de_semana(jueves).
dia_de_semana(viernes).
dia_de_semana(sabado).
dia_de_semana(domingo).


nombre_empresa("YPF").
nombre_empresa("Monsanto Agropecuaria").
nombre_empresa("Iveco").
nombre_empresa("Folder-IT").
nombre_empresa("Facebook").
nombre_empresa("Manaos").

lista(NombrePredicado,L):-
    listaAux(NombrePredicado,L,[]).

listaAux(NombrePredicado,[M|L],Aux):-
    call(NombrePredicado,M),
    not(member(M, Aux)), !,
    append(Aux, [M], Aux2),
    listaAux(NombrePredicado,L, Aux2).

listaAux(NombrePredicado,[],Aux).

tomarUno(NombrePredicado,X):-
    lista(NombrePredicado,P), random_member(X,P).

fake_nombre(X):-
    N1 is random(3)+1,
    N2 is random(2)+1,
    fake_nombrePila(N1, Y1),
    fake_apellido(N2, Y2),
    append(Y1, Y2, Y3),
    concatenarListaStrings(Y3, X).

fake_nombrePila(0, []).
fake_nombrePila(N, [P|X]):-  
    A is N-1,
    repeat,
    tomarUno(nombre,P),
    fake_nombrePila(A, X),
    is_set([P|X]),!.

fake_apellido(0, []).
fake_apellido(N, [P|X]):-  
    A is N-1,
    repeat,
    tomarUno(apellido,P),
    fake_apellido(A, X),
    is_set([P|X]), !.

concatenarListaStrings([Y],Y):-!.
concatenarListaStrings([Y1|Ys], S):-
    concatenarListaStrings(Ys, P),
    string_concat(" ", P, Aux),
    string_concat(Y1, Aux, S).


%CUANDO TOCA "PB" EL PROGRAMA TIRA UNA EXCEPCION

fake_direccion(X):-
    N is random(4),
    armarDireccion(N,X).

armarDireccion(0,X):-
    fake_calle(S1),
    fake_numero_casa(S2),
    string_concat(S1," ",Aux),
    string_concat(Aux, S2, X).
armarDireccion(1,X):-
    fake_calle(S1),
    fake_numero_casa(S2),
    fake_piso(S3),
    string_concat(S1," ",Aux),
    string_concat(Aux, S2, Aux2),
    string_concat(Aux2," Piso:", Aux3),
    string_concat(Aux3, S3, X).
armarDireccion(2,X):-
    fake_calle(S1),
    fake_numero_casa(S2),
    fake_numero_departamento(S3),
    string_concat(S1," ",Aux),
    string_concat(Aux, S2, Aux2),
    string_concat(Aux2," Dpto:", Aux3),
    string_concat(Aux3, S3, X).
armarDireccion(3,X):-
    fake_calle(S1),
    fake_numero_casa(S2),
    fake_piso(S3),
    fake_numero_departamento(S4),
    string_concat(S1," ",Aux),
    string_concat(Aux, S2, Aux2),
    string_concat(Aux2," Piso:", Aux3),
    string_concat(Aux3, S3, Aux4),
    string_concat(Aux4, " Dpto:", Aux5),
    string_concat(Aux5, S4, X).

fake_calle(X):-
    lista(calle,P),
    random_member(X, P).
fake_numero_casa(X):-
    random(1000,15001,N),
    number_string(N, X).
fake_piso(X):-
    A is random(41)+1,
    A=\=41, !,
    number_string(A, X).
fake_piso("pb").

fake_numero_departamento(X):-
    A is random(28)+1,
    numero_depto(X,A).
    numero_depto(X,A):-
    A=<20, !,
    number_string(A,X).
numero_depto(X,A):-
    N is A+44,
    char_code(X,N).



fake_ciudad(X):-
    tomarUno(ciudad,X).

fake_pais(X):-
    tomarUno(pais,X).

fake_provincia(X):-
    tomarUno(provincia,X).

fake_dia_de_semana(X):-
    tomarUno(dia_de_semana,X).

fake_nombre_color(X):-
    tomarUno(nombre_color,X).

fake_nombre_empresa(X):-
    tomarUno(nombre_empresa,X).

fake_moneda(Sigla, Nombre):-
    tomarUno(moneda,[Sigla,Nombre]).

fake_fecha([Anio,Mes,Dia],[A1,B1,C1],[A2,B2,C2]):-
    date_time_stamp(date(A1,B1,C1),X),
    date_time_stamp(date(A2,B2,C2),Y),
    random(X,Y,Aux),
    stamp_date_time(Aux, Fecha, 'UTC'),
    date_time_value(year, Fecha, Anio),
    date_time_value(month, Fecha, Mes),
    date_time_value(day, Fecha, Dia).


generar_tabla_datos(especificacion_tabla(CantReng, ColList), tabla(Nombres,Renglones)):- armarCabecera(ColList, Nombres), 
	armarListaTipos(ColList, ListaTipos), armarTabla(CantReng, ListaTipos, Renglones),!.

armarTabla(0, ListaTipos, []):-!.
armarTabla(CantReng, ListaTipos, [Renglon|Renglones]):-armarRenglon(ListaTipos, Renglon), N is CantReng-1,
		armarTabla(N, ListaTipos, Renglones).

armarCabecera([col(Nombre,Tipo)], [Nombre]):-!.
armarCabecera([col(Nombre,Tipo) | Cols], [Nombre|Nombres]):-armarCabecera(Cols,Nombres).

tipo(nombre, Retorno):- fake_nombre(Retorno). 

armarRenglon([Tipo],[Elemento]):-tipo(Tipo,Elemento),!.
armarRenglon([Tipo|Tipos], [Elemento|Resto]):-tipo(Tipo,Elemento), armarRenglon(Tipos,Resto).

armarListaTipos([col(Nombre,Tipo)], [Tipo]):-!.
armarListaTipos([col(Nombre,Tipo) | Cols], [Tipo|Tipos]):-armarListaTipos(Cols,Tipos).
