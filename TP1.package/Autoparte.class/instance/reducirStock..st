as yet unclassified
reducirStock: n
	"Reduce el stock en n"
	(n > stock) ifTrue: [ Object error: 'No hay suficiente stock' ] ifFalse:	[stock:= stock - n].