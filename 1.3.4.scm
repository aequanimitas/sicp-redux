(load "util")
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (average y (/ x (square y))))) 1.0))

(cube-root 125)

; exercise 1.41
(define (double fn)
  (lambda (x) (fn (fn x))))

(define (inc x)
  (+ 1 x))

(((double (double double)) inc) 5)
