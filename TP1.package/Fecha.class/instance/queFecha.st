as yet unclassified
queFecha
	"Devuelve un arreglo con el dia el mes y el año de la fecha en ese orden"
	| coleccion |
	coleccion := OrderedCollection new.
	coleccion add: dia.
	coleccion add: mes.
	coleccion add: anio.
	^coleccion.