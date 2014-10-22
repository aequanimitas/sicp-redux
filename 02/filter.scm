(define (filters adverb seq)
  (cond ((null? seq) ())
        ((adverb (car seq)) (cons (car seq) (filters adverb (cdr seq))))
        (else (filters adverb (cdr seq)))))

(filters odd? (list 1 2 3 4 5))
