(load "list-operators")

(define (for-eac proc items)
  (cond ((null? items) #t)
        (else (proc (car items)) 
              (for-eac proc (cdr items)))))

(for-eac (lambda (x) (newline) (display (square x))) (list 1 2 3 4))
