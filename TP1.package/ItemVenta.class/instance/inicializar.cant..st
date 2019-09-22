as yet unclassified
inicializar: unaAutoparte cant: n
	"Inicializa la instancia del item de venta"
	autoparte:= unaAutoparte.
	cantidad := n.
	"precioVigente := (unaAutoparte costo) shallowCopy.
	precioConImpuestos := (unaAutoparte calcularPrecioDeVenta) shallowCopy."
	^self.