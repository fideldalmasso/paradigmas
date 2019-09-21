operaciones con ventas
agregarAlCarro: unaAutoparte de: unCliente cant: n
	"Agrega un item al carrito de un cliente"
	| item |
	item := ItemVenta new:(listaAutopartes at: (unaAutoparte nroPieza)) cant:n.
	unCliente agregarAlCarrito: item.
	