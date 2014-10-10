(load "util")

(define (mapz proc items)
  (if (null? items)
        `()
         (cons (proc (car items))
               (mapz proc (cdr items)))))

(define (square-list-hop l)
  (map square l))

(define (square-list-loop items)
  (if (null? items)
      `()
       (cons (square (car items)) (square-list-loop (cdr items)))))

(equal? (square-list-loop (list 1 2 3 4)) (square-list-hop (list 1 2 3 4)))
