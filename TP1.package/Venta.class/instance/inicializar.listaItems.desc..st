as yet unclassified
inicializar: unCliente listaItems: unCarrito desc: unDescuento
	"Inicializa la instancia de venta"
"	|fechaHoy|
	fechaHoy := Date today.
	fecha := Fecha newFechaHoy. "
	
	fecha:= Date today.
	
	cliente:= unCliente.

	porcentajeDescuento := unDescuento.
	
	mesesGarantia := (Empresa mesesGarantia) shallowCopy.
	
	totalNeto:=0.
	listaItems := unCarrito.
	
	(unCarrito items) do:
	[ :i | 
	i calcularPrecios. 
	totalNeto:= totalNeto + (i precioConImpuestos * i cantidad).
	i autoparte reducirStock: i cantidad.
	].

	importeDescontado:= totalNeto*(porcentajeDescuento/100).
	totalAbonado := totalNeto - importeDescontado.
	^self.