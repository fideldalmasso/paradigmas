as yet unclassified
inicializar: unCliente listaItems: unCarrito desc: unDescuento
	"Inicializa la instancia de venta"
	|fechaHoy|
	fechaHoy := Date today.
	cliente:= unCliente.
	
	fecha := Fecha new:(fechaHoy dayOfMonth) mes:(fechaHoy monthIndex) anio:(fechaHoy year).
	
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