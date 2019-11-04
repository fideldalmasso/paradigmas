operaciones con autopartes
incorporarAutoparte: unaAutoparte cantidad: cant

(cant < 0) ifTrue:[Object error: 'Cantidad no puede ser negativo'] ifFalse:[
(listaAutopartes includes: unaAutoparte) 
ifTrue: [unaAutoparte agregarStock: cant.]
ifFalse: [Object error: 'ERROR: no existe la autoparte'].
].