as yet unclassified
obtenerAutoparte: nroPieza
|autoparte|
autoparte:= listaAutopartes detect: [:i| i consultarNroPieza  = nroPieza] ifNone: [ Object error:'No existe la autoparte'].
^(autoparte)  