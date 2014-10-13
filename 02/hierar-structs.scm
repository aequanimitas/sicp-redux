(load "list-operators")

(define samp (list (cons (list 1 2) (list 3 4)) (cons 1 2)))

(len (list))

(len (list (list 1 2) (list 3 4)))

(length (cons (list 1 2) (list 1 2))))

(cons (list 1 2) (list 3 4))

(define (leaves l)
  (cond ((null? l) 0)
        ((not (pair? l)) 1)
        (else (+ (leaves (cdr l)) (leaves (car l))))))


(leaves samp)
(list 1 (list 2 (list 3 4)))
(length (list 1 (list 2 (list 3 4))))
