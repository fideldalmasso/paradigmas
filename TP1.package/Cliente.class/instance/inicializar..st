as yet unclassified
inicializar: unDni
	"Inicializa los atributos de la instancia de cliente"
	dni := unDni.
	carrito := OrderedCollection new:0.
	listaVentas := OrderedCollection new:0.
	^self.