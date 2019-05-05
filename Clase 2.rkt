;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Clase 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (automovil valores atributos)(
                                      cond
                                           ((null? valores) (list))
                                           (else (cons (list (car atributos) (car valores)) (automovil (cdr valores) (cdr atributos)))
                                           )
                                          )
  )

(define (eliminarArbol valor arbol)(
                                    cond
                                     ((equal? valor (valor arbol)) (
                                                                  cond
                                                                   ((and (null? (izq arbol)) (null? (der arbol))) '())
                                                                   ((null? (izq arbol)) (der arbol))
                                                                   ((null? (der arbol)) (izq arbol))
                                                                   (else (lista (mayor (izq arbol)) (eliminarArbol (mayor (izq arbol))) (der arbol)))))

                                                                   ))
                                     ((< valor (valor arbol)) (cons  
                                     ))

(define (valor nodo)(car nodo))

(define (izq nodo)(cadr nodo))

(define (der nodo)(caadr nodo))

(define (mayor nodo)(cond
                      ((null? (der nodo)) (valor nodo))
                      (else (mayor nodo))))