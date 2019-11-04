as yet unclassified
inicializar: unNroPieza descripcion: unaDescripcion costo: unCosto
	"Inicializa los atributos de autoparte"
	listaImpuestos:= OrderedCollection new:0.
	stock := 0.
	cantVendidos := 0.
	costo := unCosto.
	descripcion := unaDescripcion.
	nroPieza := unNroPieza.
	^self.