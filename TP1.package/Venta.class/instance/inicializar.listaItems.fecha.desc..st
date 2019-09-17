as yet unclassified
inicializar: unCliente listaItems: unaListaItems fecha: unaFecha desc: unDescuento
	"Inicializa la instancia de venta"
	cliente:= unCliente.
	listaItems := unaListaItems.
	fecha := unaFecha.
	porcentajeDescuento := unDescuento.
	total:=0.
	1 to: (listaItems size) do:
	[ :i | total:= total + ((listaItems at: i) precioConImpuestos * (listaItems at: i) cantidad)  ].
	^self.