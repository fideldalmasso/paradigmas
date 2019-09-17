as yet unclassified
aplicarImpuesto: unImpuesto a: nroPieza
	"Agrega un impuesto a la lista de impuestos de una autoparte"
	1 to: (listaAutopartes size) do: [ :i | ((listaAutopartes at:i) consultarNroPieza = nroPieza)
									ifTrue:[(listaAutopartes at:i) agregarImpuesto: unImpuesto]].
								