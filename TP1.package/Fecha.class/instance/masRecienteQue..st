as yet unclassified
masRecienteQue: unaFecha
	"Retorna true si es mas reciente que la fecha pasada"
	| diferencia1 diferencia2 fechaHoy hoy|
	hoy := Date today.
	fechaHoy := Fecha new:hoy dayOfMonth mes: hoy monthIndex anio:hoy year.
	diferencia1 := (self diferenciaEnMeses: fechaHoy).
	diferencia2 := (unaFecha diferenciaEnMeses: fechaHoy).
	((diferencia1 min: diferencia2) = diferencia1) ifTrue:[^true] ifFalse:[^false]. 	