(define (count-leaves seq)
  (cond ((null? seq) 0)
        ((not (pair? seq)) 1)
        (else (+ (count-leaves (cdr seq)) (count-leaves (car seq))))))

(define z (list 1 (list 2 (list 3 (list 4 5)))))

(count-leaves z)

(count-leaves (list 1))
