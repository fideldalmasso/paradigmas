as yet unclassified
inicializarFechaHoy
	|hoy|
	hoy := Date today.
	dia := hoy dayOfMonth.
	mes := hoy monthIndex.
	anio := hoy year.
	^self.