operaciones con ventas
enGarantias: nroPieza cliente: dni
	|cliente ventasDePieza|
	 cliente:= self obtenerCliente: dni.
	ventasDePieza:= cliente compras select: [ :i | (cliente compras at:i) obtenerPiezas includes: ((cliente compras at:i) obtenerAutoparte: nroPieza) ]. 
	