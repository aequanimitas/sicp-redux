; exercise 2.4
(load "util_math.scm")
(define (cons-2.4 x y)
  (lambda (m) (m x y)))

(define (car-2.4 z)
  (z (lambda (p q) p)))

(define (cdr-2.4 z)
  (z (lambda (p q) q)))

((lambda (x y) (x y)) square 2)

; let's regress for better insight
((lambda (x y) 
  (lambda (m) (m x y))) 
