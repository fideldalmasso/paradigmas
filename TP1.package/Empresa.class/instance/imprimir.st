as yet unclassified
imprimir

World submorphs
  detect: [ :m | m model = Transcript ]
  ifNone: [ Transcript open ].

Transcript clear; show: '---Autopartes registradas---'; cr.
listaAutopartes do:[ :i | i imprimir].

Transcript cr; show: '---Clientes registrados---'; cr.
listaClientes do:[ :i | i imprimir].

Transcript cr; show: '---Ventas registradas---'; cr.
listaVentas do:[ :i | i imprimir ].



"nroPieza stock descripcion costo listaImpuestos cantVendidos"