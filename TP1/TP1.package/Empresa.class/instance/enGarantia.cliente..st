operaciones con ventas
enGarantia: nroPieza cliente: dni
	| comprasDelCliente fechaHoy fechaVencimiento ultimaCompra|
	
	comprasDelCliente := (listaClientes at: dni) compras.
	ultimaCompra:=	comprasDelCliente detect: [ :i | (i obtenerPiezas) includes: (listaAutopartes at:nroPieza) ].
	fechaVencimiento:=(ultimaCompra fecha) addMonths: (ultimaCompra mesesGarantia).
	
	fechaHoy:= Date today.
	
	^((fechaHoy) <= (fechaVencimiento)).
		