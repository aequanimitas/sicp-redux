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
          (else (iter (next a) (combiner (term a) result)))))
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
