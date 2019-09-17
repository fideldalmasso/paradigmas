as yet unclassified
consultarStock: nroPieza
	"Devuelve el stock de una autoparte determinada"
	1 to: (listaAutopartes size) do:
		[ :i | ((listaAutopartes at: i) consultarNroPieza = nroPieza) 
						ifTrue:[^((listaAutopartes at:i ) stockPieza)]].