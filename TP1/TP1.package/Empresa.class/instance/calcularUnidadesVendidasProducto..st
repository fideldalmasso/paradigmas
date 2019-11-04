operaciones con autopartes
calcularUnidadesVendidasProducto: nroPieza
	"Retorna la cantidad de ventas de una autoparte"
	^((listaAutopartes at: nroPieza)cantVendidos).
	