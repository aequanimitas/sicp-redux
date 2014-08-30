(define (sum-range x y termfn)
  (define (iter a b result)
    (if (= b 0)
        result
        (iter (+ a 1) (- b 1) (+ (termfn a) result)))) 
  (iter x y 0))

(define (product-range x y termfn)
  (define (iter a b result)
    (if (= b 0)
        result
        (iter (+ a 1) (- b 1) (* (termfn a) result)))) 
  (iter x y 1))

(define (accumulate x y termfn combiner start-value null-value step)
  (define (iter a b result)
    (if (= b null-value)
        result
        (iter (+ a 1) (step b) (combiner (termfn a) result)))) 
  (iter x y start-value))

(define (decrement x)
  (- x 1))

(define (sum-range-a x y termfn)
  (accumulate x y termfn + 0 0 decrement))

(define (product-range-a x y termfn)
  (accumulate x y termfn * 1 0 decrement))

(define (identity x)
  x)

(define (cube x)
  (* x x x))

(= (sum-range 1 10 identity) (sum-range-a 1 10 identity))
(= (product-range 1 10 identity) (product-range-a 1 10 identity))
(product-range-a 1 10 identity)

; exercise
(define (factorial start end)
  (product-range-a start end identity))

(factorial 1 5)

; exercise 1.33
(define (smallest-divisor x)
  (define (divides? x y)
    (= (remainder y x) 0))
  (define (find-divisor x y)
    (cond ((> (square y) x) x)
          ((divides? y x) y)
          (else (find-divisor x (+ y 1)))))
  (find-divisor x 2))

(define (prime? x)
  (= x (smallest-divisor x)))

(define (filtered-accumulate x y termfn combiner start-value null-value step filter-cond)
  (define (iter a b result)
    (cond ((= b null-value) result)
          ((filter-cond a) (iter (+ a 1) (step b) (combiner (termfn a) result)))
          (else (iter (+ a 1) (step b) result))))
  (iter x y start-value))

(define (sum-of-squares-primes x y)
  (filtered-accumulate x y square + 0 0 decrement prime?))

(sum-of-squares-primes 1 10)
