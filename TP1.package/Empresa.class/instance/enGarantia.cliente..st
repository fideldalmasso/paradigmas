as yet unclassified
enGarantia: nroPieza cliente: dni
	| ventasDePieza cliente comprasDelCliente ventaMasReciente fechaGarantia fechaHoy|
	fechaHoy := Fecha newFechaHoy.
	cliente := self obtenerCliente:dni.
	comprasDelCliente := cliente compras.
	ventasDePieza := OrderedCollection new.
	1 to: (comprasDelCliente size) do: [ :i | 1 to:(((comprasDelCliente at:i) obtenerPiezas) size) 
		do:[ :j | (((comprasDelCliente at:i) obtenerPiezas at:j) consultarNroPieza = nroPieza)
			ifTrue:[ventasDePieza add: (comprasDelCliente at:i)] ]].
	ventaMasReciente := (ventasDePieza at:1).
	2 to: (ventasDePieza size) do:[ :i | 
		(((ventasDePieza at:i) fecha) masRecienteQue: (ventaMasReciente fecha)) ifTrue:[ventaMasReciente:=(ventasDePieza at:i)]].

	