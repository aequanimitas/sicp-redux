(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; "Simplify"

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (identity a)
  (a))

(define (sum-cube a b)
  (sum cube a inc b))

(define (sum-ints a b)
  (sum identity a next b))

(sum-cube 1 10)
(sum-integers 1 10)
