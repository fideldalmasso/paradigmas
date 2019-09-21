operaciones con clientes
agregarCliente: unCliente

(listaClientes includes: unCliente)
		ifTrue: [^'ERROR: el cliente ya existe'] 
		ifFalse: [ listaClientes  at:(unCliente dni) put:unCliente]. 