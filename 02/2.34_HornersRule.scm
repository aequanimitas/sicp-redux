(define (accumulate initial combiner seq)
  (if (null? seq)
      initial
      (combiner (car seq) (accumulate initial combiner (cdr seq)))))

(accumulate 0 + (list 1 2 3 4 5))

(define (horner-eval x coeff-seq)
  (accumulate 0 (lambda (this-coeff h-terms) 
                  (+ this-coeff (* x h-terms))) 
              coeff-seq))

; equation is 1 + 3x + 5x^3 + x^5 where x = 2

(horner-eval 2 (list 1 3 0 5 0 1))

; checking based on khan acad
(horner-eval 3 (list 7 -2 3 -1 0 2))
