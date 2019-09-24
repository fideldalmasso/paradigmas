|empresaABC cliente1 cliente2 cliente3 cliente4 autoparte1 autoparte2 autoparte3 impuesto1 impuesto2 impuesto3 carrito1 carrito2 carrito3|

Empresa margenComercial: 5; mesesGarantia: 6.

"------------- Creación de variables iniciales -------------"
empresaABC:= Empresa new.

impuesto1:= ImpuestoFijo new: 200.
impuesto2:= ImpuestoVariable new: 13.
impuesto3:= ImpuestoEscalonado new: 8000 tope2: 30000 pcentaje1: 5  pcentaje2: 8 pcentaje3: 10.


"------------- Manejo de autopartes -------------"
"Ejemplo autoparte con impuesto fijo"
autoparte1:= Autoparte new: 25407 descripcion: 'Puerta delantera izquierda Ford Ka' costo: 10000.
empresaABC agregarAutoparte: autoparte1.
empresaABC incorporarAutoparte: autoparte1 cantidad: 10. 
empresaABC aplicarImpuesto: impuesto1 a: (autoparte1 nroPieza).


"Ejemplo autoparte con impuesto variable"
autoparte2:= Autoparte new: 25408 descripcion: 'Cubierta Volkswagen Gol' costo: 5500.
empresaABC agregarAutoparte: autoparte2.
empresaABC incorporarAutoparte: autoparte2 cantidad: 20. 
empresaABC aplicarImpuesto: impuesto2 a: (autoparte2 nroPieza).


"Ejemplo autoparte con todos los tipos de impuesto"
autoparte3:= Autoparte new: 25409 descripcion: 'Espejo retrovisor interior Ford Focus' costo: 8000.
empresaABC agregarAutoparte: autoparte3.
empresaABC incorporarAutoparte: autoparte3 cantidad: 30. 
empresaABC aplicarImpuesto: impuesto1 a: (autoparte3 nroPieza).
empresaABC aplicarImpuesto: impuesto2 a: (autoparte3 nroPieza).
empresaABC aplicarImpuesto: impuesto3 a: (autoparte3 nroPieza).
 
"------------- Ejemplo de venta satisfactoria -------------"

cliente1:= Cliente new: 41976708.
empresaABC agregarCliente: cliente1.
carrito1:= Carrito new.
carrito1 agregar: autoparte1 cant: 2.
empresaABC generarVenta: carrito1 a: cliente1 descuento: 1.
empresaABC enGarantia: 25407 cliente: 41976708.


"------------- Ejemplo de venta de múltiples autopartes  -------------"
cliente2:= Cliente new: 41656940.
empresaABC agregarCliente: cliente2.
carrito2:= Carrito new.
carrito2 agregar: autoparte1 cant: 3.
carrito2 agregar: autoparte2 cant: 3.
carrito2 agregar: autoparte3 cant: 3.
empresaABC generarVenta: carrito2  a: cliente2  descuento: 5.
empresaABC enGarantia: 25408 cliente: 41656940.

"Ejemplo de venta con garantía caducada"
cliente3:= Cliente new: 41656939.
empresaABC agregarCliente: cliente3.
carrito3:= Carrito new.
carrito3 agregar: autoparte3 cant: 10.
empresaABC generarVenta: carrito3  a: cliente3  descuento: 5 fecha: ((Date today)addMonths: -7).
empresaABC enGarantia: 25409 cliente: 41656939.

"Ejemplo de cliente sin compras"
cliente4:= Cliente new: 42307935.
empresaABC agregarCliente: cliente4.
empresaABC calcularVentasCliente: 42307935.


"------------- Ejemplo de consultar stock ------"
empresaABC consultarStock:25409.

"------------ Ejemplo de consutar precio de venta ---------"
empresaABC consultarPrecioDeVenta:25407.

"----------- Ejemplo de calcular total de ventas en un mes ---------"
empresaABC calcularTotalVentasMes: 9.

empresaABC calcularTotalVentasMes: 12.

"--------- Ejemplo de calcular ventas cliente --------"
empresaABC calcularVentasCliente: 41976708.

"--------- Ejemplo de calcularUnidadesVenidasProducto --------"
empresaABC calcularUnidadesVendidasProducto: 25407.

empresaABC imprimir.