;auxiliares
;auxiliar construirLugarMarca
(define construirLugarMarca (lambda(lLugares)
                              (if (null? lLugares) lLugares
                                  (cons (list (car lLugares) 0) (construirLugarMarca (cdr lLugares)) 
                                        ))))
;aux quitarLugar
(define quitarLugar(lambda (red)
                     (list (car red) (cdadr red) (cddr red))
                     ))
;queries
;esLugar?
(define esLugar? (lambda (red nodo)
                   (if (eqv? (member nodo (lugares red)) #f) #f
                       #t
                       )))
;esTransicion?
(define esTransicion? (lambda (red nodo)
                        (if (eqv? (member nodo (transiciones red)) #f) #f
                            #t
                            )))
;esArco?
(define esArco? (lambda (red arco)
                  (if (eqv? (member arco (caddr red)) #f) #f
                      #t
                      )))
;arcoValido?
(define arcoValido? (lambda(red arco)
                      (if (or (and (esLugar? red (car arco)) (esTransicion? red (cadr arco)))
                              (and (esLugar? red (cadr arco)) (esTransicion? red (car arco))))
                          #t
                          #f
                          )))
;arcoAgregable?
(define arcoAgregable? (lambda (red arco)
                        (if (and (arcoValido? red arco) (not (esArco? red arco)))
                            #t
                            #f
                            )))
;getters:
;transiciones
(define transiciones (lambda (red)
                       (car red)
                       ))
;arcos
(define arcos (lambda (red)
                (caddr red)
                ))
;lugares
(define lugares (lambda (red)
                  (if (null? (cadr red)) '()
                      (cons (caaadr red) (lugares(quitarLugar red))
                            ))))
;quitarArco
(define quitarArco(lambda (arcos arco)
                    (if (equal? (car arcos) arco) (cdr arcos)
                        (cons (car arcos) (quitarArco (cdr arcos) arco))    
                        )))

; 1) crearRed
(define crearRed (lambda (lTransiciones lLugares lArcos)
                   (list lTransiciones (construirLugarMarca lLugares) lArcos)
                   ))
;2) +arco
(define +arco (lambda (red nodo1 nodo2)
                (if (arcoAgregable? red (list nodo1 nodo2))
                    (list (car red) (cadr red) (append (list (list nodo1 nodo2)) (caddr red1)))
                    nil
                    )))
;3) -arco
(define -arco (lambda (red nodo1 nodo2)
                (if (arcoValido? red (list nodo1 nodo2))
                (if (not(esArco? red (list nodo1 nodo2))) red
                    (list (car red) (cadr red) (quitarArco (arcos red) (list nodo1 nodo2)))    
                    ) "Arco no valido"
                      )))

;constantes
;red1
(define transiciones1 '(ta tb tc td))
(define lugares1 '(la lb lc ld le lf))
(define arcos1 '((la ta) (ta lb) (ta lc) (lb tb) (lc tc) (tb ld)
                         (tc le) (ld td) (le td) (td lf)))
(define red1 (crearRed transiciones1 lugares1 arcos1))