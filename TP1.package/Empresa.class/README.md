|empresaABC cliente1 cliente2 cliente3 autoparte1 autoparte2 autoparte3 impuesto1 impuesto2 impuesto3 carrito1 carrito2 carrito3 bool ultimaCompra|

Empresa margenComercial: 5; mesesGarantia: 6.

"------------- Creación de variables iniciales -------------"
empresaABC:= Empresa new.

autoparte1:= Autoparte new: 25407 descripcion: 'Puerta delantera izquierda Ford Ka' costo: 10000.
autoparte2:= Autoparte new: 25408 descripcion: 'Cubierta Volkswagen Gol' costo: 5500.
autoparte3:= Autoparte new: 25409 descripcion: 'Espejo retrovisor interior Ford Focus' costo: 1000.
 
cliente1:= Cliente new: 41976708.
cliente2:= Cliente new: 41656940.
cliente3:= Cliente new: 41656939.

impuesto1:= ImpuestoFijo new: 200.
impuesto2:= ImpuestoVariable new: 13.
impuesto3:= ImpuestoEscalonado new: 8000 tope2: 30000 pcentaje1: 5  pcentaje2: 8 pcentaje3: 10.

carrito1:= Carrito new.
carrito2:= Carrito new.
carrito3:= Carrito new.

"------------- Manejo de clientes -------------"
empresaABC agregarCliente: cliente1.
empresaABC agregarCliente: cliente2.
empresaABC agregarCliente: cliente3.

"------------- Manejo de autopartes -------------"
empresaABC agregarAutoparte: autoparte1.
empresaABC incorporarAutoparte: autoparte1 cantidad: 10. 

empresaABC agregarAutoparte: autoparte2.
empresaABC incorporarAutoparte: autoparte2 cantidad: 16. 

empresaABC agregarAutoparte: autoparte3.
empresaABC incorporarAutoparte: autoparte3 cantidad: 20. 

"------------- Manejo de impuestos -------------"

empresaABC aplicarImpuesto: impuesto1 a: (autoparte1 nroPieza).
empresaABC aplicarImpuesto: impuesto3 a: (autoparte1 nroPieza).

empresaABC aplicarImpuesto: impuesto2 a: (autoparte2 nroPieza).
empresaABC aplicarImpuesto: impuesto3 a: (autoparte2 nroPieza).

"------------- Manejo de carritos -------------"
carrito1 agregar: autoparte1 cant: 2.
carrito1 agregar: autoparte2 cant: 2.
carrito1 agregar: autoparte3 cant: 2.

carrito2 agregar: autoparte2 cant: 8.
carrito3 agregar: autoparte3 cant: 10.

"------------- Manejo de ventas -------------"

empresaABC generarVenta: carrito1 a: cliente1 descuento: 1.


"------------- Ejemplos de garantia -------------"
"Garantia válida"
empresaABC generarVenta: carrito2  a: cliente2  descuento: 5.
empresaABC enGarantia: 25407 cliente: 41976708.

"Garantia caducada"
empresaABC generarVenta: carrito3  a: cliente3  descuento: 5 fecha: ((Date today)addMonths: -7).
empresaABC enGarantia: 25407 cliente: 41976708.

empresaABC imprimir.
^empresaABC.
