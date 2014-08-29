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

(define (identity x)
  x)

(define (cube x)
  (* x x x))

(sum-range 1 10 identity)
(sum-range 1 10 cube)
(product-range 10 1 identity)
(product-range 10 1 cube)
