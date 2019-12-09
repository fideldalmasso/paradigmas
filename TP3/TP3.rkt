;chupame el pingo definidas
(define transiciones1 '(ta tb tc td))
(define lugares1 '(la lb lc ld le lf))
(define arcos1 '((la ta) (ta lb) (ta lc) (lb tb) (lc tc) (tb ld)
                        (tc le) (ld td) (le td) (td lf)))


;auxiliar construirLugarMarca
(define construirLugarMarca (lambda(lLugares)
                              (if (null? lLugares) lLugares
                                  (cons (list (car lLugares) 0) (construirLugarMarca (cdr lLugares)) 
                                        ))))
; 1) crearRed
(define crearRed (lambda (lTransiciones lLugares lArcos)
                   (list lTransiciones (construirLugarMarca lLugares) lArcos)
                   ))
;red1
(define red1 (crearRed transiciones1 lugares1 arcos1))


;2) +arco
;(define +arco (lambda (red nodo1 nodo2)
 ;               (if (arcoValido (red nodo1 nodo2))
                

  ;                  )))

;arcoValido
(define arcoValido (lambda (red nodo1 nodo2)
                     (if (and (or (and (esLugar? red nodo1) (esTransicion? red nodo2))
                                  (and (esLugar? red nodo2) (esTransicion? red nodo1)))
                              (not (esArco? red (list nodo1 nodo2)))) #t
                                                               #f
                                                               )))

  ;lugares
  (define lugares (lambda (red)
                    (if (null? (cadr red)) '()
                               (cons (caaadr red) (lugares(quitarLugar red))
                               ))))


  ;aux quitarLugar epico
  (define quitarLugar(lambda (red)
                       (list (car red) (cdadr red) (cddr red))
                       ))

;esLugar
(define esLugar? (lambda (red nodo)
                  (if (eqv? (member nodo (lugares red)) #f) #f
                      #t
                      )))

;esTransicion?
(define esTransicion? (lambda (red nodo)
(if (eqv? (member nodo (transiciones red)) #f) #f
                      #t
                        )))

;transiciones
(define transiciones (lambda (red)
(car red)
                       ))

;es arco
(define esArco? (lambda (red arco)
(if (eqv? (member arco (caddr red)) #f) #f
    #t
                  )))

  