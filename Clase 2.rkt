;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Clase 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (automovil valores atributos)(
                                      cond
                                           ((null? valores) (list))
                                           (else (cons (list (car atributos) (car valores)) (automovil (cdr valores) (cdr atributos)))
                                           )
                                          )
  )

(define (eliminarArbol valor arbol)(
                                    cond
                                     ((equal? valor (car arbol)) (
                                                                  cond
                                                                   ((and (null? (cadr arbol)) (null? (caddr arbol))) '())
                                                                   ((null? (cadr arbol)) (caddr arbol))
                                                                   (else #f)

                                                                   ))
                                     (else #t)
                                     ))