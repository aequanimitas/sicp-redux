(define (dec x)
  (- x 1))

(define (inc x)
  (+ x 1))

(define (nothing? x)
  (= x 0))

(define (accumulate a b accu step combiner null-value c-term)
  (define (iter a b accu step combiner null-value c-term)
    (if (null-value b)
        accu
        (iter a (step b) (combiner accu c-term) step combiner null-value c-term)))
  (iter a b accu dec combiner nothing? c-term))

(define (sum a b)
  (accumulate a b a dec + nothing? 1))

(define (product a b)
  (accumulate a (- b 1) a dec + nothing? a))

(sum 12 8)
(product 4 5)
(= (sum 12 8) (product 4 5)) 
