as yet unclassified
inicializar: unCliente listaItems: unaListaItems fecha: unaFecha desc: unDescuento
	"Inicializa la instancia de venta"
	cliente:= unCliente.
	listaItems := unaListaItems.
	fecha := unaFecha.
	porcentajeDescuento := unDescuento.
	totalNeto:=0.
	1 to: (listaItems size) do:
	[ :i | totalNeto:= totalNeto + ((listaItems at: i) precioConImpuestos * (listaItems at: i) cantidad)  ].
	importeDescontado:= totalNeto*0.01*porcentajeDescuento.
	totalAbonado := totalNeto - importeDescontado.
	^self.