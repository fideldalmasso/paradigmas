as yet unclassified
calcularVentasCliente: dni
	"Retorna el monto total vendido al cliente"
	| cliente montoTotal | 
	cliente:= (self obtenerCliente:dni).
	montoTotal := 0.
	1 to: ((cliente compras) size) do: [ :i | montoTotal := (montoTotal + ((cliente compras at:i) monto )) ].
	^montoTotal.