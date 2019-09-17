as yet unclassified
inicializar: unNroPieza descripcion: unaDescripcion costo: unCosto
	"Inicializa los atributos de autoparte"
	listaImpuestos:= OrderedCollection new.
	stock := 0.
	costo := (unCosto * (Empresa margenComercial)).
	descripcion := unaDescripcion.
	nroPieza := unNroPieza.
	^self.