(define (accumulate-i a b n-a n-b accu accu-fn)
  (if (= b 0)
      accu
      (accumulate-i (n-a a) (n-b b) n-a n-b (accu-fn a accu) accu-fn)))

(define (factorial a fn)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (acc x y) (* x y))
  (fn 1 a inc dec 1 acc))

(define (sum x y fn)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (acc x y) (+ x 1))
  (fn x y inc dec 0 acc))

(factorial 5 accumulate-i)
(sum 10 12 accumulate-i)
