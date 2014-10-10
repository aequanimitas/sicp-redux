(load "list-operators")

(define (rev l)
  (define (iter x o r)
    (if (= x 0)
        r
        (iter (- x 1) (cdr o) (cons (car o) r))))
  (iter (len l) l (list)))

(rev (list 1 2 3 4))
