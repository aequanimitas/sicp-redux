(define (pascal x y)
  (define (runner x y)
     (cond ((or (= x y) (= y 1)) 1)
           ((or (= x 0) (= y 0)) 1)
           ((+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))))
   
  (runner x y))

; base cases
(pascal 1 1)
(pascal 0 0)
(pascal 13 1)
(pascal 2 1)
(pascal 2 2)

; traversing to parent nodes
(pascal 3 2)
(pascal 5 3)
(= (pascal 6 3) (pascal 6 4))
