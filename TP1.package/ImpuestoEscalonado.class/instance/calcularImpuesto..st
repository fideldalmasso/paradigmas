as yet unclassified
calcularImpuesto: unCosto

(unCosto between: 0 and: tope1Inclusivo) ifTrue:[^(unCosto*0.01*pcentaje1)] 
										ifFalse:[(unCosto between:tope1Inclusivo and:tope2Inclusivo) ifTrue:[^(unCosto*0.01*pcentaje2)] ifFalse:[^(unCosto*0.01*pcentaje3)]].