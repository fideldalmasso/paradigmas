operaciones con ventas
calcularTotalVentasMes: mes

	"Devuelve el monto total de las ventas del mes"

|total|
total:= 0.

(listaVentas select: [ :i | (i fecha)monthIndex = mes ]) do: [ :i | total:= total + (i totalAbonado)].
^total.