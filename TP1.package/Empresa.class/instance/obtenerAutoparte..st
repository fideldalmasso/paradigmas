operaciones con autopartes
obtenerAutoparte: nroPieza

^ listaAutopartes at: nroPieza ifAbsent: [ Object error:'No existe la autoparte'].

