(define (pascal x y)
  (if (or (= y 1) (= x y))
      1
      0))

(= 1 (pascal 2 1))
(= 1 (pascal 2 2))

(= 2 (pascal 3 2))
