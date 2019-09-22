operaciones con ventas
calcularTotalVentasMes: mes

	"Devuelve el monto total de las ventas del mes"
	"
	| montoTotal |
	montoTotal := 0.
	1 to: (listaVentas size) do:[ :i | (((listaVentas at:i) fecha) queMes = mes)
			ifTrue: [montoTotal:=(montoTotal + ((listaVentas at:i) totalAbonado))]].
	^montoTotal
"

|total|
total:= 0.

(listaVentas select: [ :i | (i fecha)monthIndex = mes ]) do: [ :i | total:= total + (i totalAbonado)].
^total.