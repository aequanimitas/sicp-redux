(load "util_math.scm")
; exercise 2.2

(define (make-rational-basic n d) (cons n d))
(define ex2.2.01 (make-segment (make-point -3 19) (make-point -4 27)))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  0)

(make-point 3 -2)
(start-segment ex2.2.01)
(print-point (make-point -3 19))
(start-segment ex2.2.01)
(midpoint ex2.2.01)

(define (midpoint a)
  (make-rational-basic (/ (+ (car (car a)) (car (cdr a))) 2.0) (/ (+ (cdr (car a)) (cdr (cdr a))) 2)))

(define ex2.3.01 (make-segment (make-point -3 19) (make-point -4 27)))
(midpoint ex2.3.01)
