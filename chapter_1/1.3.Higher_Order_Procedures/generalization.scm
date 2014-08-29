(define (dec-by-1 x)
  (- x 1))

(define (inc-by-1 x)
  (+ x 1))

(define (double x)
  (+ x x))

(define (sum a b next term)
  (define (iter a result)
    (if (= a 0)
        result
        (iter (next a) (term result))))
  (iter a b))

(define (product a b next term)
  (define (iter x result)
    (if (= x 0)
        result
        (iter (next x) (term result b))))
  (iter a 0))

(sum 3 4 dec-by-1 +)
(product 3 4 dec-by-1 +)
