(define (dec x)
  (- x 1))

(define (inc x)
  (+ x 1))

(define (nothing? x)
  (= x 0))

(define (accumulate a b accu step combiner null-value c-term)
  (define (iter a b accu)
    (if (null-value b)
        accu
        (iter a (step b) (combiner accu c-term))))
  (iter a b accu))

(define (sum a b)
  (accumulate a b a dec + nothing? 1))

(define (product a b)
  (accumulate a (- b 1) a dec + nothing? a))

; specific cases
(define (sum-cubes a b)
  (define (iter a b accu)
    (if (= b 0)
        accu
        (iter (+ a 1) (- b 1) (+ accu (* a a a)))))
  (iter a b 0))

(sum 12 8)
(product 4 5)
;(= (sum 12 8) (product 4 5)) 
