as yet unclassified
inicializar: unCliente listaItems: unaListaItems desc: unDescuento
	"Inicializa la instancia de venta"
	|fechaHoy|
	fechaHoy := Date today.
	cliente:= unCliente.
	listaItems := unaListaItems.
	fecha := Fecha new:fechaHoy dayOfMonth mes:fechaHoy monthIndex anio:fechaHoy year .
	porcentajeDescuento := unDescuento.
	totalNeto:=0.
	1 to: (listaItems size) do:
	[ :i | totalNeto:= totalNeto + ((listaItems at: i) precioConImpuestos * (listaItems at: i) cantidad)  ].
	importeDescontado:= totalNeto*0.01*porcentajeDescuento.
	totalAbonado := totalNeto - importeDescontado.
	^self.