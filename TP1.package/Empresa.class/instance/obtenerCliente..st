as yet unclassified
obtenerCliente: dni
	"Devuelve el cliente con el dni pasado como argumento"
	|cliente|
	cliente := listaClientes detect: [:i| i consultarDni  = dni] ifNone: [ Object error:'No existe el cliente'].
   ^cliente.