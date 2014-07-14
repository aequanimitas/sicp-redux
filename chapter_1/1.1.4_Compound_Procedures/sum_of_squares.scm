(load "square.scm")
(define (sum-of-squares x y) (+ (square x) (square y)))
(sum-of-squares 7 8)

(define (sum-of-squares-lambda x y)
    (+ ((lambda (a) (* a a)) x)
       ((lambda (b) (* b b)) y)))

(sum-of-squares-lambda 7 8)
