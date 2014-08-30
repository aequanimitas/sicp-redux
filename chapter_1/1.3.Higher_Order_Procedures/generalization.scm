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
      (* (term a) (product-range-i (next x) y term next))))

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
