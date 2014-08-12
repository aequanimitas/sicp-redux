(define (peso-coin-denomination denom-key)
  (cond ((= denom-key 1) 1)
        ((= denom-key 2) 5)
        ((= denom-key 3) 10)
        ((= denom-key 4) 25)))

(define (counting-change x)
  (define (change x y)
    (cond ((= x 0)
          1)
          ((or (< x 0) (= y 0)) 0)
          (else
                (+ (change x (- y 1))
                   (change (- x (peso-coin-denomination y)) y)))))
  (change x 4))

(counting-change 11)
