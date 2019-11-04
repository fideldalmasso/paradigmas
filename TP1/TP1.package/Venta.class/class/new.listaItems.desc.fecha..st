instance creation
new: unCliente listaItems: unaListaItems desc: unDescuento fecha: unaFecha
	"Crea una instancia de Venta"
	^((super new) inicializar: unCliente listaItems: unaListaItems desc: unDescuento  fecha: unaFecha ).