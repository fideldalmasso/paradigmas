operaciones con autopartes
agregarAutoparte: unaAutoparte

(listaAutopartes includes: unaAutoparte) 
		ifTrue: [^'ERROR: la autoparte ya existe'] 
		ifFalse: [ listaAutopartes at:(unaAutoparte nroPieza) put: unaAutoparte]. 