as yet unclassified
calcularTotalVentasMes: mes
	"Devuelve el monto total de las ventas del mes"
	| montoTotal |
	montoTotal := 0.
	1 to: (listaVentas size) do:[ :i | (((listaVentas at:i) fecha) queMes = mes)
			ifTrue: [montoTotal:=(montoTotal + ((listaVentas at:i) monto))]].
	^montoTotal