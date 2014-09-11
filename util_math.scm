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
