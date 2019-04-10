;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |miembro, eliminar, quicksort|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (miembro valor lista) (cond
                                ((null? lista) #f)
                                ((equal? valor (car lista)) #t)
                                (else (miembro valor (cdr lista)))
                                                 ))

(define (eliminar valor lista) (cond
                                 ((null? lista) #f)
                                 ))