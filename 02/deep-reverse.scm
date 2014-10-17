(define n (list (list 1 2) (list 3 4)))

(define (dr z)
  (if (and (pair? (car z)) (equal? `() (cdr z)))
      (reverse (car z))
      (list (dr (cdr z)) (reverse (car z)))))

(dr n)
