as yet unclassified
incorporarAutoparte: unaAutoparte cantidad: cant

listaAutopartes do: [:i|(unaAutoparte == listaAutopartes at:i	) ifTrue: [ (listaAutopartes at:i) agregarStock: cant ] ifFalse: [^'No existe la autoparte']].