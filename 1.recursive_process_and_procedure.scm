; recursive procedure
(define (inc x y)
  (if (= y 0)
      x
      (inc (+ x 1) (- y 1))))

; recursive process
(define (inc-2 x y)
  (if (= y 0)
      x
      (+ 1 (inc x (- y 1)))))

(inc 9 10)
(inc-2 9 10)
