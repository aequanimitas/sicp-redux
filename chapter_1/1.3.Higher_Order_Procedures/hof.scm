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


