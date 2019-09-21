operaciones con clientes
obtenerCliente: dni

^ listaClientes at: dni ifAbsent: [ Object error:'No existe el cliente'].