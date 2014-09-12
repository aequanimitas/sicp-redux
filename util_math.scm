(define (make-point x y)
  (cons x y))

(define (make-segment x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (midpoint a)
  (make-rational-basic (/ (+ (car (car a)) (car (cdr a))) 2.0) (/ (+ (cdr (car a)) (cdr (cdr a))) 2)))
