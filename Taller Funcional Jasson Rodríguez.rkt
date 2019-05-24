;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Taller Funcional|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Función factorial
;Parámetros:
;n: número al que se desea calcular su factorial
(define (factorial n)(cond ((zero? n) 1)
                           (else (* n (factorial (- n 1))))
                           ))

;Función fibonacci
;Parámetros:
;n: elemento de la sucesión de fibonacci que se desea obtener
(define (fib  n)(cond ((zero? n) 1)
                      ((= 1 n) 1)
                      (else (+ (fib (- n 1)) (fib (- n 2))))))

;Función miembro
;Parámetros:
;valor: elemento que se desea buscar
;lista: lista de elementos en la que se va a buscar
(define (miembro valor lista) (cond
                                ((null? lista) #f)
                                ((equal? valor (car lista)) #t)
                                (else (miembro valor (cdr lista)))
                                ))
;Función eliminar
;Parámetros:
;valor: elemento que se desea eliminar
;lista: lista de elementos en la que se va a buscar
(define (eliminar valor lista) (cond
                                 ((null? lista) '())
                                 ((equal? valor (car lista)) (cdr lista))
                                 (else (cons (car lista) (eliminar valor (cdr lista))))
                                 ))

;Función quicksort
;Parámetros:
;lista: lista que se desea ordenar
(define (qsrt lista)(cond
                      ((> (length lista) 1) (helper (car lista) (cdr lista)))
                      ((equal? (length lista) 1) lista)
                      (else '())))

;Función auxiliar helper
;Parámetros:
;pivot: pivote a utilizar
;lista: lista a ordenar sin el pivote
(define (helper pivot lista)(append (qsrt (menores pivot lista)) (list pivot) (qsrt (mayores pivot lista))))

;Función auxiliar mayores
;Parámetros:
;pivot: pivote con el cual comparar los elementos
;lista: lista a clasificar
(define (mayores pivot lista)(cond
                               ((null? lista) '())
                               ((< pivot (car lista)) (cons (car lista) (mayores pivot (cdr lista))))
                               (else (mayores pivot (cdr lista)))))

;Función auxiliar menores
;Parámetros:
;pivot: pivote con el cual comparar los elementos
;lista: lista a clasificar
(define (menores pivot lista)(cond
                               ((null? lista) '())
                               ((> pivot (car lista)) (cons (car lista) (menores pivot (cdr lista))))
                               (else (menores pivot (cdr lista)))))

;Función automovil
;Parámetros:
;valores: lista de valores de los atributos
;atributos: lista de atributos del automovil
(define (automovil valores atributos)(
                                      cond
                                       ((null? valores) (list))
                                       (else (cons (list (car atributos) (car valores)) (automovil (cdr valores) (cdr atributos)))
                                             )))

;Función eliminar de un árbol
;Parámetros:
;elemento: valor del elemento a eliminar del árbol
;arbol: lista que contiene la estructura del árbol
(define (eliminarArbol elemento arbol)(
                                       cond
                                        ((equal? elemento (valor arbol)) (
                                                                          cond
                                                                           ((and (null? (izq arbol)) (null? (der arbol))) '())
                                                                           ((null? (izq arbol)) (der arbol))
                                                                           ((null? (der arbol)) (izq arbol))
                                                                           (else (list (mayor (izq arbol)) (eliminarArbol (mayor (izq arbol)) (izq arbol)) (der arbol)))))                              
                                        ((< elemento (valor arbol)) (list (valor arbol) (eliminarArbol elemento (izq arbol)) (der arbol)))
                                        ((> elemento (valor arbol)) (list (valor arbol) (izq arbol) (eliminarArbol elemento (der arbol))))
                                        ))

;Función auxiliar valor
;Parámetros:
;nodo: nodo del que se quiere obtener el valor
(define (valor nodo)(cond
                      ((list? nodo)(car nodo))
                      (else nodo)))

;Función auxiliar izq
;Parámetros:
;nodo: nodo del que se quiere obtener el hijo izquierdo
(define (izq nodo)(cond
                    ((list? nodo)(cadr nodo))
                    (else '())))

;Función auxiliar der
;Parámetros:
;nodo: nodo del que se quiere obtener el hijo derecho
(define (der nodo)(cond
                    ((list? nodo)(caddr nodo))
                    (else '())))

;Función auxiliar mayor
;Parámetros:
;nodo: nodo del que se quiere obtener el mayor elemento de su subárbol izquierdo
(define (mayor nodo)(cond
                      ((null? (der nodo)) (valor nodo))
                      (else (mayor (der nodo)))))

;Función breadth first search
;Formato de grafo '((nodo (lista vecinos))(nodo (lista vecinos)))
;Parámetros: 
;valor: elemento a buscar en el grafo
;nodo: nodo inicial del grafo
(define (bfs inicio fin grafo)(bfs-aux (list (list inicio)) fin grafo '()))

;Función auxiliar breadth first search
;Parámetros: 
;rutas: rutas parciales
;fin: valor del nodo final
;grafo: grafo a buscar
;total: rutas exitosas
(define (bfs-aux rutas fin grafo total)(cond
                                         ((null? rutas)(acomodar total))
                                         ((solucion? fin (car rutas))
                                          (bfs-aux (cdr rutas) fin grafo (cons (car rutas) total)))
                                         (else (bfs-aux (append (cdr rutas) (extender (car rutas) grafo)) fin grafo total))))

;Función auxiliar solucion?
;Parámetros:
;fin: elemento del grafo que se busca alcanzar
;ruta: ruta actual
(define (solucion? fin ruta)(equal? fin (car ruta)))

;Función auxiliar vecinos
;Parámetros:
;elemento: elemento del grafo del cual se quieren conocer sus vecinos
;grafo: grafo en el cual buscar
(define (vecinos elemento grafo)(cond
                                  ((equal? elemento (caar grafo))
                                   (cadar grafo))
                                  (else (vecinos elemento (cdr grafo)))))

;Función auxiliar extender
;Parámetros:
;ruta: ruta que se desea extender
;grafo: grafo en el cual buscar
(define (extender ruta grafo)(extender-aux ruta (vecinos (car ruta) grafo) grafo))

;Función auxiliar extender-aux
;Parámetros:
;ruta: ruta que se desea extender
;vecinos: vecinos del ultimo movimiento de la ruta
;grafo: grafo en el cual buscar
(define (extender-aux ruta vecinos grafo)(cond
                                           ((null? vecinos) '())
                                           (else
                                            (cond
                                              ((miembro (car vecinos) ruta)
                                               (extender-aux ruta (cdr vecinos) grafo))
                                              (else (cons
                                                     (cons (car vecinos) ruta)
                                                     (extender-aux ruta (cdr vecinos) grafo)))))))

;Función auxiliar acomodar
;Parámetros:
;rutas: lista de rutas a revertir
(define (acomodar rutas)(cond
                          ((null? rutas) '())
                          (else (cons (inverso (car rutas)) (acomodar (cdr rutas))))))

;Función auxiliar inverso
;Parámetros:
;lista: lista que se desea invertir
(define (inverso lista)(cond
                         ((null? lista) '())
                         (else (append (inverso (cdr lista)) (list (car lista))))))


