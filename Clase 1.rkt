;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Clase 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (factorial n)(cond ((zero? n) 1)
                           (else (* n (factorial (- n 1))))
                           ))


(define (fib  n)(cond ((zero? n) 1)
                      ((= 1 n) 1)
                      (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (miembro valor lista) (cond
                                ((null? lista) #f)
                                ((equal? valor (car lista)) #t)
                                (else (miembro valor (cdr lista)))
                                                 ))

(define (eliminar valor lista) (cond
                                 ((null? lista) '())
                                 ((equal? valor (car lista)) (cdr lista))
                                 (else (cons (car lista) (eliminar valor (cdr lista))))
                                 ))

(define (quicksort lista)(