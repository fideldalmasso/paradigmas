operaciones con ventas
enGarantia: nroPieza cliente: dni
	| comprasDelCliente fechaHoy fechaVencimiento ultimaCompra|
	
	"fechaHoy := Fecha newFechaHoy."
	comprasDelCliente := (listaClientes at: dni) compras.
	ultimaCompra:=	comprasDelCliente detect: [ :i | (i obtenerPiezas) includes: (listaAutopartes at:nroPieza) ].
	fechaVencimiento:=(ultimaCompra fecha) addMonths: (ultimaCompra mesesGarantia).
	
	fechaHoy:= Date today.
	
	^((fechaHoy) <= (fechaVencimiento)).
	
"

Las líneas de arriba reemplazan todo lo siguiente
	ventasDePieza := OrderedCollection new.

	1 to: (comprasDelCliente size) do: [ :i | 1 to:(((comprasDelCliente at:i) obtenerPiezas) size) 
		do:[ :j | (((comprasDelCliente at:i) obtenerPiezas at:j) nroPieza = nroPieza)
			ifTrue:[ventasDePieza add: (comprasDelCliente at:i)] ]].
	ventaMasReciente := (ventasDePieza at:1).
	

	2 to: (ventasDePieza size) do:[ :i | 
		(((ventasDePieza at:i) fecha) masRecienteQue: (ventaMasReciente fecha)) ifTrue:[ventaMasReciente:=(ventasDePieza at:i)]].
"	