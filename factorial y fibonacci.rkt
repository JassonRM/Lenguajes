;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |factorial y fibonacci|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (factorial n)(cond ((zero? n) 1)
                           (else (* n (factorial (- n 1))))
                           ))


(define (fib  n)(cond ((zero? n) 1)
                      ((= 1 n) 1)
                      (else (+ (fib (- n 1)) (fib (- n 2))))))