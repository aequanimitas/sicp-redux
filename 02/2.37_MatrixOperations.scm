(define (accumulate initial combiner seq)
  (if (null? seq)
      initial
      (combiner (car seq) (accumulate initial combiner (cdr seq)))))

(define matrix-example (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vector-example (list 6 7 8 9))

(define (dot-product v w)
  (accumulate 0 + (map * v w)))

(dot-product vector-example vector-example)

(define (transpose mat)
  
