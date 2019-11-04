as yet unclassified
topes
	"Devuelve los topes en forma de arreglo ordenado"
	| coleccion |
	coleccion := OrderedCollection new.
	coleccion add: tope1Inclusivo.
	coleccion add: tope2Inclusivo.
	^coleccion.