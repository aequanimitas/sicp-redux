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

(define (accumulate x y termfn combiner start-value)
  (define (iter a b result)
    (if (= b 0)
        result
        (iter (+ a 1) (- b 1) (combiner (termfn a) result)))) 
  (iter x y start-value))

(define (sum-range-a x y termfn)
  (accumulate x y termfn + 0))

(define (product-range-a x y termfn)
  (accumulate x y termfn * 1))

(define (identity x)
  x)

(define (cube x)
  (* x x x))

(= (sum-range 1 10 identity) (sum-range-a 1 10 identity))
(= (product-range 1 10 identity) (product-range-a 1 10 identity))
