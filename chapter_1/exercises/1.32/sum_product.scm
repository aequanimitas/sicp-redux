(define (accumulate-i a b n-a n-b accu accu-fn g-l)
  (if (g-l b)
      accu
      (accumulate-i (n-a a) (n-b b) n-a n-b (accu-fn a accu) accu-fn g-l)))

(define (factorial a fn)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (g-l x) (= x 0))
  (define (acc x y) (* x y))
  (fn 1 a inc dec 1 acc g-l))

(define (sum x y fn)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (g-l x) (= x 0))
  (define (acc x y) (+ x 1))
  (fn x y inc dec 0 acc g-l))

(trace-exit accumulate-i)
(sum 10 12 accumulate-i)
