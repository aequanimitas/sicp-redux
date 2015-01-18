(define a (list 1 3 0 5 0 1))

(define (accumulate initial combiner seq)
  (if (null? seq)
      initial
      (combiner (car seq) (accumulate initial combiner (cdr seq)))))

(define (count-leaves t)
  (accumulate 0 (lambda (x y)
                
