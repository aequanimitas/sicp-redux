(define n (list (list 1 2) (list 3 4)))

(define (dr z)
  (if (and (pair? (car z)) (null? (cdr z)))
      (reverse (car z))
      (cons (dr (cdr z)) (car z))))

(dr n)
