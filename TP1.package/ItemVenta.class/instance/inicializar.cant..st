as yet unclassified
inicializar: unaAutoparte cant: n
	"Inicializa la instancia del item de venta"
	autoparte:= unaAutoparte.
	cantidad := n.
	precioVigente := (unaAutoparte precioVigente) shallowCopy.
	precioConImpuestos := (unaAutoparte precioConImpuestos) shallowCopy.
	^self.