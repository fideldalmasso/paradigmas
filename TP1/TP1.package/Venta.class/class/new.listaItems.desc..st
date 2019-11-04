instance creation
new: unCliente listaItems: unaListaItems desc: unDescuento
	"Crea una instancia de Venta"
	(unDescuento < 0) ifTrue:[Object error:'No capo, no podes meter un descuento negativo'] ifFalse:
	[^((super new) inicializar: unCliente listaItems: unaListaItems desc: unDescuento)].