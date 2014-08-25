(define (itsthelittlethings a b btfn atfn)
  ((if (> b 0) btfn atfn) a b))

(itsthelittlethings 0 2 + -)
(itsthelittlethings 2 0 + -)
(itsthelittlethings 2 -1 + -)
(itsthelittlethings -2 -1 + -)
