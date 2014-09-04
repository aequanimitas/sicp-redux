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

; exercise 1.42
(define (compose fnx fny)
  (lambda (x) (fnx (fny x))))

((compose square (lambda (x) x)) 6)
((compose square inc) 6)
((compose inc square) 6)

; exercise 1.43
(define (repeated fnx x)
  (if (= x 1)
      fnx
      (compose fnx (repeated fnx (- x 1)))))

((repeated square 2) 5)
