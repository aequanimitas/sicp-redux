(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

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

(define (inc x)
  (+ x 1))

(define (identity a)
  (a))

(define (sum-cube a b)
  (sum cube a inc b))

(define (sum-ints a b)
  (sum identity a next b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
(sum-cube 12 1)
(sum-integers 1 10)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(integral cube 0 1 0.01)

(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (sums-r a b)
  (if (= b 0)
      a
      (+ 1 (sums-r a (- b 1)))))

(define (sums-i a b)
  (if (= b 0)
      a
      (sums-i (+ a 1) (- b 1))))

(sums-r 12 0) 
(sums-r 12 1)
(= (sums-i 12 1) (sums-r 12 1))

(define (product-r a b)
  (if (= b 0)
      0
      (+ a (product-r a (- b 1)))))

(define (product-i a b accu)
  (if (= b 0)
      a
      (product-i a (- b 1) (+ accu a))))
      

(product-r 3 0)
(product-r 3 4)
(product-i 3 4 0)
(= (product-r 3 4) (sums-i 12 0))
(= (product-i 3 4 0) (sums-i 12 0))
