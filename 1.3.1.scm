; exercise 1.31
(define (sum-range-i x y term next)
  (define (iter a result)
    (if (> a y)
        result
        (iter (next a) (+ (term a) result))))
  (iter x 0))

(define (sum-range-r x y term next)
  (if (> x y)
      0
      (+ (term x) (sum-range-r (next x) y term next))))

(define (product-range-i x y term next)
  (define (iter a result)
    (if (> a y)
        result
        (iter (next a) (* (term a) result))))
  (iter x 1))

(define (product-range-r x y term next)
  (if (> x y)
      1
      (* (term x) (product-range-i (next x) y term next))))

(define (increment x)
  (+ x 1))

(define (identity x)
  x)

(define (cube x)
  (* x x x))

(sum-range-i 1 5 identity increment)


(= (sum-range-i 2 3 identity increment) (sum-range-r 2 3 identity increment))
(= (sum-range-i 2 3 square increment) (sum-range-r 2 3 square increment))
(= (sum-range-i 2 3 cube increment) (sum-range-r 2 3 cube increment))
(= (product-range-i 2 3 cube increment) (product-range-i 2 3 cube increment))
(= (product-range-i 2 3 square increment) (product-range-i 2 3 square increment))
(= (product-range-i 2 3 identity increment) (product-range-i 2 3 identity increment))


; exercise 1.32
(define (accumulate-r x y term next combiner null-value)
  (if (> x y)
      null-value
      (combiner (term x) (accumulate-r (next x) y term next combiner null-value))))

(define (accumulate-i x y term next combiner null-value)
  (define (iter a result)
    (if (> a y)
      result
      (iter (next a) (combiner (term a) result))))
  (iter x null-value))

(= (sum-range-i 2 3 identity increment) (accumulate-i 2 3 identity increment + 0))
(= (sum-range-i 2 3 square increment) (accumulate-i 2 3 square increment + 0))
(= (sum-range-i 2 3 cube increment) (accumulate-i 2 3 cube increment + 0))
(= (product-range-i 2 3 cube increment) (accumulate-i 2 3 cube increment * 1))
(= (product-range-i 2 3 square increment) (accumulate-i 2 3 square increment * 1))
(= (product-range-i 2 3 identity increment) (accumulate-i 2 3 identity increment * 1))


(= (sum-range-r 2 3 identity increment) (accumulate-r 2 3 identity increment + 0))
(= (sum-range-r 2 3 square increment) (accumulate-r 2 3 square increment + 0))
(= (sum-range-r 2 3 cube increment) (accumulate-r 2 3 cube increment + 0))
(= (product-range-i 2 3 cube increment) (accumulate-r 2 3 cube increment * 1))
(= (product-range-i 2 3 square increment) (accumulate-r 2 3 square increment * 1))
(= (product-range-i 2 3 identity increment) (accumulate-r 2 3 identity increment * 1))

(define (filtered-accumulate-i x y term next combiner null-value filter-cond)
  (define (iter a result)
    (cond ((> a y) result)
          ((filter-cond a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter x null-value))

(define (smallest-divisor x y)
  (define (find-divisor endpoint startpoint)
    (cond ((> (square startpoint) endpoint) endpoint)
          ((divides? endpoint startpoint) startpoint)
          (else (find-divisor endpoint (+ startpoint 1)))))
  (define (divides? endpoint startpoint)
    (= (remainder endpoint startpoint) 0))
  (find-divisor x y))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (primes-sum-square-range x y)
  (filtered-accumulate-i x y square increment + 0 prime?))

(primes-sum-square-range 6 7)

(define (are-coprimes? x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (define (fn z fun)
    (fun z))
  (fn x co-prime?))

(are-coprimes? 6 36)
(are-coprimes? 5 36)

(define (is-a-co-prime? x)
  (= 1 (gcd x y)))

(define (product-of-coprimes-fn-scope x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 is-a-co-prime?))

(product-of-coprimes-fn-scope 2 3)

(define (product-of-coprimes x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 co-prime?))

(product-of-coprimes 2 3)


(sum-range-i 1 7 identity increment)
(sum-range-i 1 6 identity increment)
