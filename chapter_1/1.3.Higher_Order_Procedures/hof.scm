(define (sum-iterative a b)
  (if (= b 0)
      a
      (sum-iterative (+ a 1) (- b 1))))

(define (sum-recursive a b)
  (if (= b 0)
      a
      (+ (sum-recursive (+ 1 a) (- b 1)))))

(sum-iterative 10 12)
(sum-recursive 10 12)

(= (sum-iterative 10 12) (sum-recursive 10 12))

(define (cube x)
 (* x x x))

(define (sum-of-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-of-cubes (+ 1 a) b))))

(define (sum-of-cubes-i a b accu)
  (if (= b 0)
      accu
      (sum-of-cubes-i (+ a 1) (- b 1) (+ accu (cube a)))))

(define (sum-iterative a b accu)
  (if (= b 0)
      accu
      (sum-iterative (+ a 1) (- b 1) (+ accu a))))

(define (sg a b n-a n-b accu accu-fn g-l)
  (if (g-l b)
      accu
      (sg (n-a a) (n-b b) n-a n-b (+ accu (accu-fn a)) accu-fn g-l)))

(define (soci a b)
  (define (inc x) (+ 1 x))
  (define (dec x) (- x 1))
  (define (g-l x) (= x 0))
  (define (identity x) (x))
  (sg a b inc dec 0 cube g-l))

(= (sum-of-cubes-i 1 10 0) (soci 1 10))
(soci 1 10000000)
