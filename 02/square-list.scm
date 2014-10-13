(load "list-operators")

(define (square-list-hop l)
  (map-to square l))

(define (square-list-map-hop l)
  (map-hop square l))

(define (square-list-loop items)
  (if (null? items)
      `()
      (cons (square (car items)) (square-list-loop (cdr items)))))

(square-list-map-hop (list 1 2 3 4))
(square-list-hop (list 1 2 3 4))
(square-list-loop (list 1 2 3 4))
