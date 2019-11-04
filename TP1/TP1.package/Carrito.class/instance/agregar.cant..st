as yet unclassified
agregar: unaAutoparte cant: n
	"Agrega un item al carrito de un cliente"
	| item |
	item := ItemVenta new:unaAutoparte cant:n.
	items add:item.
