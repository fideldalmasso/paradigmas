instance creation
new: unCliente listaItems: unaListaItems desc: unDescuento
	"Crea una instancia de Venta"
	^((super new) inicializar: unCliente listaItems: unaListaItems desc: unDescuento).