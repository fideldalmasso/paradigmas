as yet unclassified
obtenerPiezas
	"Retorna una coleccion con las piezas involucradas en la compra"
	| piezas |
	piezas := OrderedCollection new.
	1 to: (listaItems size) do:[ :i | piezas add: ((listaItems at: i) autoparte)].
	^piezas.
	