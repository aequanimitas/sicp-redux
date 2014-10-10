(load "list-operators")
(define (spar . z)
  (define (iter x oper box box2)
    (cond ((= x 0) (rev box2))
          ((oper (car box)) 
            (iter (- x 1) oper (cdr box) (cons (car box) box2 )))
          (else (iter (- x 1) oper (cdr box) box2))))
      
  (cond ((null? z) 0)
        ((even? (len z)) (iter (len z) even? z (list)))
        (else (iter (len z) odd? z (list)))))

(spar 1 2 3)
