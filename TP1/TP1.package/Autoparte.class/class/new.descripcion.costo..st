instance creation
new: unNroPieza descripcion: unaDescripcion costo: unCosto
	"Crea una nueva instancia de autoparte"
	^((super new) inicializar: unNroPieza descripcion: unaDescripcion costo: unCosto).