(define (accumulator a b n-a n-b accu accu-fn g-l)
  (if (g-l b)
      accu
      (accumulator (n-a a) (n-b b) n-a n-b (accu-fn a accu) accu-fn g-l)))

(define (factorial a)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (g-l x) (= x 0))
  (define (acc x y) (* x y))
  (accumulator 1 a inc dec 1 acc g-l))

(define (sum x y)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (g-l x) (= x 0))
  (define (acc x y) (+ x 1))
  (accumulator x y inc dec 0 acc g-l))

(factorial 5)
(sum 10 12)
