as yet unclassified
diferenciaEnMeses: fecha2
	"Devuelve la diferencia en meses entre dos fecha"
	| anio1 anio2 mes1 mes2 |
	anio1 := self  queAnio.
	anio2 := fecha2 queAnio.
	mes1 := self  queMes.
	mes2 := fecha2 queMes.
	(anio1 >= anio2) ifTrue:[^(((anio1-anio2)*12)+(mes1-mes2))] ifFalse:[^(((anio2-anio1)*12)+(mes2-mes1))].