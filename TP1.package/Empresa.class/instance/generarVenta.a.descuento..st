operaciones con ventas
generarVenta: listaItems a: unCliente descuento: desc
|venta|

venta:=( Venta new: unCliente listaItems: listaItems desc: desc).

unCliente comprar: venta.

listaVentas add: venta.

unCliente vaciarCarrito.