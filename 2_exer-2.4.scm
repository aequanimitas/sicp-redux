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
(lambda (z)
  (z (lambda (p q) p)))

; anonymous procedure returns with 1 and 2 as arguments to be used along with the returned procedure
((lambda (x y) 
  (lambda (m) (m x y))) 1 2)

; barok form
((lambda (z)
  (z (lambda (p q) p))) ((lambda (x y) (lambda (m) (m x y))) 1 2))

(((lambda (x y) 
  (lambda (m) (m x y))) 1 2) -)
