;auxiliares
;inicializarMarcado
(define inicializarMarcado (lambda(lLugares)
                             (if (null? lLugares) lLugares
                                 (cons (list (car lLugares) 0) (inicializarMarcado (cdr lLugares))) 
                                 )))
;construirLugarMarca
(define construirLugarMarca (lambda(lLugares marcado)
                              (if (null? lLugares) lLugares
                                  (cons (list (car lLugares) (car marcado)) (construirLugarMarca (cdr lLugares) (cdr marcado))) 
                                  )))
;quitarLugar
(define quitarLugar(lambda (red)
                     (list (car red) (cdadr red) (cddr red))
                     ))
;miembro?
(define miembro? (lambda (elemento lista)
                   (if (null? lista)
                       #f
                       (if (equal? elemento (car lista))
                           #t
                           (miembro? elemento (cdr lista))))))
;quitarArco
(define quitarArco(lambda (getArcos arco)
                    (if (equal? (car getArcos) arco) (cdr getArcos)
                        (cons (car getArcos) (quitarArco (cdr getArcos) arco))    
                        )))

;---------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------
;queries
;esLugar? 
(define esLugar? (lambda (red nodo)
                   (if (eqv? (member nodo (getLugares red)) #f) #f
                       #t
                       )))
;esTransicion?
(define esTransicion? (lambda (red nodo)
                        (miembro? nodo (getTransiciones red)) 
                        ))
;esArco?
(define esArco? (lambda (red arco)
                  (miembro? arco (caddr red)) 
                  ))
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


;---------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------
;getters:
;getTransiciones
(define getTransiciones (lambda (red)
                          (car red)
                          ))
;getArcos
(define getArcos (lambda (red)
                   (caddr red)
                   ))
;getLugares
(define getLugares (lambda (red)
                     (if (null? (cadr red)) 
                         '()
                         (cons (caaadr red) (getLugares(quitarLugar red))
                               ))))
; marcado
(define getMarcado (lambda (lLugaresYMarcas)
                     (if (null? lLugaresYMarcas)
                         '()
                         (cons (cadar lLugaresYMarcas) (getMarcado (cdr lLugaresYMarcas)))
                         )))
; getEntradasANodo
(define getEntradasANodo (lambda (lArcos nodo)
                           (if (null? lArcos)
                               '()
                               (if (equal? (cadar lArcos) nodo)
                                   (cons (caar lArcos) (getEntradasANodo (cdr lArcos) nodo))
                                   (getEntradasANodo (cdr lArcos) nodo))
                               )))
; getSalidasDeNodo
(define getSalidasDeNodo (lambda (lArcos nodo)
                           (if (null? lArcos)
                               '()
                               (if (equal? (caar lArcos) nodo)
                                   (cons (cadar lArcos) (getSalidasDeNodo (cdr lArcos) nodo))
                                   (getSalidasDeNodo (cdr lArcos) nodo))
                               )))

; getLugaresYMarcas
(define getLugaresYMarcas (lambda (red)
                            (cadr red)
                            ))

;---------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------

; 1) crearRed
(define crearRed (lambda (lTransiciones lLugares lArcos)
                   (list lTransiciones (inicializarMarcado lLugares) lArcos)
                   ))
;2) +arco
(define +arco (lambda (red nodo1 nodo2)
                (if (arcoAgregable? red (list nodo1 nodo2))
                    (list (car red) (cadr red) (append (list (list nodo1 nodo2)) (caddr red)))
                    'nil
                    )))
;3) -arco
(define -arco (lambda (red nodo1 nodo2)
                (if (arcoValido? red (list nodo1 nodo2))
                    (if (not(esArco? red (list nodo1 nodo2))) red
                        (list (car red) (cadr red) (quitarArco (getArcos red) (list nodo1 nodo2)))    
                        )
                    'nil
                    )))

; 4) marcar
(define marcar (lambda (red marcado)
                 (if (not (equal? (length (getLugares red)) (length marcado)))
                     "El tamaño del marcado ingresado es inválido"
                     (list (getTransiciones red) (construirLugarMarca (getLugares red) marcado) (getArcos red))
                     )))

; 5) marcado?
(define marcado? (lambda (red)
                   (getMarcado (getLugaresYMarcas red))
                   ))
; 6a) habilitada?
(define habilitada? (lambda (red T)
                      (validarEntradas (getEntradasANodo (getArcos red) T) (getLugaresYMarcas red))
                      ))


(define validarEntradas (lambda (lEntradas lLugaresYMarcas)
                          (if (null? lLugaresYMarcas)
                              #t
                              (if (miembro? (caar lLugaresYMarcas) lEntradas)
                                  (if(>= (cadar lLugaresYMarcas) 1)
                                     (validarEntradas lEntradas (cdr lLugaresYMarcas))
                                     #f)
                                  (validarEntradas lEntradas (cdr lLugaresYMarcas))
                                  ))))
                         
; 6b) habilitadas?
(define habilitadas? (lambda (red)
                       (habilitadas2? red (getTransiciones red))))

(define habilitadas2? (lambda (red lTransiciones )
                        (if (null? lTransiciones)
                            '()
                            (if(habilitada? red (car lTransiciones))
                               (cons (car lTransiciones) (habilitadas2? red (cdr lTransiciones)))
                               (habilitadas2? red (cdr lTransiciones))
                               ))))
                                            

; 7) entradas?
(define entradas?(lambda (red nodo)
                   (getEntradasANodo (getArcos red) nodo)
                   ))

; 8) salidas?
(define salidas?(lambda (red nodo)
                  (getSalidasDeNodo (getArcos red) nodo)
                  ))
; 9) disparar
(define disparar(lambda (red transicion)
                  (if (habilitada? red transicion)
                      (marcar red (actualizarMarcado (salidas? red transicion) (entradas? red transicion) (getLugaresYMarcas red)))
                      'nil
                      )))

(define actualizarMarcado(lambda (lSalidas lEntradas lLugaresYMarcas)
                           (if (null? lLugaresYMarcas)
                               '()
                               (if (miembro? (caar lLugaresYMarcas) lSalidas)
                                   (cons (+ 1 (cadar lLugaresYMarcas)) 
                                         (actualizarMarcado lSalidas lEntradas (cdr lLugaresYMarcas))) 
                                   (if (miembro? (caar lLugaresYMarcas) lEntradas)
                                       (cons (- (cadar lLugaresYMarcas) 1) 
                                             (actualizarMarcado lSalidas lEntradas (cdr lLugaresYMarcas)))
                                       (cons (cadar lLugaresYMarcas) 
                                             (actualizarMarcado lSalidas lEntradas (cdr lLugaresYMarcas)))
                                       )))))

; 10) secuencia
(define secuencia(lambda(red lTransiciones)
                   (lambda(F) (if (null? lTransiciones)
                                  '()
                                  (cons (F (disparar red (car lTransiciones))) 
                                        ((secuencia (disparar red (car lTransiciones)) (cdr lTransiciones)) F))
                                  )))) 
                                   


;---------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------
;constantes
;red1
(define transiciones1 '(ta tb tc td))
(define lugares1 '(la lb lc ld le lf))
(define arcos1 '((la ta) (ta lb) (ta lc) (lb tb) (lc tc) (tb ld)
                         (tc le) (ld td) (le td) (td lf)))
(define red1 (crearRed transiciones1 lugares1 arcos1))
(define red2 (marcar red1 '(1 0 0 0 0 0)))
(define red3 (marcar (crearRed 
                      '(ta tb tc) '(lw la lb lc) 
                      '((lw ta) (lw tb) (ta la) (ta lc) (tb lb) (tb lc) (lc tc) (tc lw))) 
                     '(1 0 0 0)))
