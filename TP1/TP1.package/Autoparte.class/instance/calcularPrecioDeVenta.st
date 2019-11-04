as yet unclassified
calcularPrecioDeVenta
|margen impuestos|
impuestos:=0.
margen:=((Empresa margenComercial * costo)/100).
listaImpuestos do: [:i| impuestos:= (impuestos + (i calcularImpuesto: costo))].
^(costo + margen + impuestos).