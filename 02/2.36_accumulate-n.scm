(define (accumulate initial combiner seq)
  (if (null? seq)
      initial
      (combiner (car seq) (accumulate initial combiner (cdr seq)))))
