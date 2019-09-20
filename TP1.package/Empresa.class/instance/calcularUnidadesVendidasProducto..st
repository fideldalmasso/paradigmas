as yet unclassified
calcularUnidadesVendidasProducto: nroPieza
	"Retorna la cantidad de vendidos de una autoparte"
	^((self obtenerAutoparte: nroPieza) vendidos).
	