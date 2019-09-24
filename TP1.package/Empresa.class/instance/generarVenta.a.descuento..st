operaciones con ventas
generarVenta: listaItems a: unCliente descuento: desc
|venta|

(desc < 0) ifTrue:[Object error:'No se puede ingresar un descuento negativo']
ifFalse:[
venta:=( Venta new: unCliente listaItems: listaItems desc: desc).

unCliente comprar: venta.

listaVentas add: venta.
].