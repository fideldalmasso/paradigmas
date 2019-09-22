operaciones con ventas
generarVenta: listaItems a: unCliente descuento: desc fecha:unaFecha
|venta|

venta:=( Venta new: unCliente listaItems: listaItems desc: desc fecha:unaFecha).

unCliente comprar: venta.

listaVentas add: venta.