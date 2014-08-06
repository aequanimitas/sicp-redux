(define (f-r n)
  (if (< n 3)
      n
      (+ (f-r (- n 1))
         (* 2 (f-r (- n 2)))
         (* 3 (f-r (- n 3))))))

(f-r 3)

(define (f-i n)
  (define (iterator w x y z)
    (if (< z 3)
        w
        (iterator (+ w (* 2 x) (* 3 y)) x y (- z 1))))
  (if (> 3 n)
      n
     (iterator 2 1 0 n)))

(f-i 3)
