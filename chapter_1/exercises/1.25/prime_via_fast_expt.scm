(define (fast-expo b e)
  (cond ((= 0 e) 1)
        ((even? n) (square (fast-exponent b (/ e 2))))
        (else (* b (fast-exponent b (- e 1))))))

(define (divides? n c)
  (= (remainder n c) 0))

(define (even? n)
  (divides? n 2))

(define (expmod b e m)
  (remainder (fast-expo b e) m))

(define (fermat-t n)
  (define (try-i a)
    (= (expmod a n n) a))
  (try-i (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-t n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 1013 2)
