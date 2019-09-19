as yet unclassified
agregarAlCarro: nroPieza de: unCliente cant: n
	"Agrega un item al carrito de un cliente"
	| item |
	item := ItemVenta new:(Empresa obtenerAutoparte: nroPieza) cant:n.
	unCliente agregarAlCarrito: item.
	