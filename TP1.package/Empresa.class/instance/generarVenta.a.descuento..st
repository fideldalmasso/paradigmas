as yet unclassified
generarVenta: listaItems a: unCliente descuento: desc
|venta|

venta:=( Venta new: unCliente listaItems: listaItems desc: desc).

unCliente comprar: venta.

listaVentas add: venta.