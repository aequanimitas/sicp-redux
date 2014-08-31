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

;(primes-sum-square-range 6 7)

(define (are-coprimes? x y)
  (define (fn z fun)
    (fun z))
  (fn x (lambda (x) (= 1 (gcd x y)))))

(are-coprimes? 6 36)
(are-coprimes? 5 36)

(define (is-a-co-prime? x)
  (= 1 (gcd x y)))

(define (product-of-coprimes-fn-scope x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 is-a-co-prime?))

;(product-of-coprimes-fn-scope 2 3)

(define (product-of-coprimes x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 co-prime?))

;(product-of-coprimes 2 3)

; let's change how proc f is visually presented to gain more intuition on using lambdas
; the "third line" are arguments passed to the immediately invoked lambda
(define (fnz-lambda x y) 
  ((lambda (a b) (+ (* x (square a)) (* y b) (* a b))) 
           (+ 1 (* x y)) (- y 1)))

(fnz-lambda 3 4)

(define (tiny-lex-scope x)
  (= x (let ((x 3)) x)))

(tiny-lex-scope 9)

; exercise 1.34

(define (f134 g)
  (g 2)) 

(f134 square)

(f134 (lambda (z) (* z (+ z 1))))

(f134 f134)
