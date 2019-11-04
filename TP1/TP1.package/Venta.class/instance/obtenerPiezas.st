as yet unclassified
obtenerPiezas
	"Retorna una coleccion con las piezas involucradas en la compra"
	| aux |
	aux := OrderedCollection new.

(listaItems items) do: [ :i | 
	(aux includes: i autoparte) ifFalse:[aux add: (i autoparte)] ].

	^aux.
	