(define (pascal x y)
  (define (edges? x y)
    (or (= x y) (= y 1)))
  (define (out-of-bounds? x y)
    (or (= x 0) (= y 0) (> y x))
  (define (runner x y)
    (cond ((edges? x y) 1)
          ((out-of-bounds? x y) 1)
          ((+ (runner (- x 1) (- y 1)) (runner (- x 1) y)))))
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
(= (pascal 8 3) 21)
(pascal 11 6)
(pascal 12 7)
(pascal 13 7)

(pascal 8 10)
