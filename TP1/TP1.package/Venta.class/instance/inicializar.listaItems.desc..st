as yet unclassified
inicializar: unCliente listaItems: unCarrito desc: unDescuento
	"Inicializa la instancia de venta"
	
	fecha:= Date today.
	
	cliente:= unCliente.
	
	mesesGarantia := (Empresa mesesGarantia) shallowCopy.
	
	totalNeto:=0.
	listaItems := unCarrito.
	
	(unCarrito items) do:
	[ :i | 
	i calcularPrecios. 
	totalNeto:= totalNeto + (i precioConImpuestos * i cantidad).
	i autoparte reducirStock: i cantidad.
	].

	porcentajeDescuento:= unDescuento.
	importeDescontado:= totalNeto*(porcentajeDescuento /100).
	totalAbonado := totalNeto - importeDescontado.
	^self.