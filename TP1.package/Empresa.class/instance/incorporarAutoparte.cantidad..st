operaciones con autopartes
incorporarAutoparte: unaAutoparte cantidad: cant

(listaAutopartes includes: unaAutoparte) 
ifTrue: [unaAutoparte agregarStock: cant.]
ifFalse: [Object error: 'ERROR: no existe la autoparte'].