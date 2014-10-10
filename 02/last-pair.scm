(load "list-operators")

(define (last-pair l)
  (if (equal? (cdr l) `())
      (car l)
      (last-pair (cdr l))))
(last-pair (list 1 2 3 4))

(define (last-pair-hop l)
  (car (rev l)))

(equal? (last-pair-hop (list 1 2 4)) (last-pair (list 1 2 3 4)))  
(equal? (last-pair-hop (list 1 2 4 5)) (last-pair (list 1 2 3 4)))  
