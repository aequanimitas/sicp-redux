(define (sum-r term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-r term (next a) next b))))

(define (sum-i term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))) 
  (iter a 0))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (identity a)
  (a))

(define (sum-cube a b sum-fn)
  (sum-fn cube a inc b))

(define (sum-ints a b sum-fn)
  (sum-fn identity a next b))

(define (pi-sum a b sum-fn)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum-fn pi-term a pi-next b))

(define (integral f a b dx sum-fn)
  (define (add-dx x) (+ x dx))
  (* (sum-fn f (+ a (/ dx 2.0)) add-dx b) dx))

(= (integral cube 0 1 0.01 sum-r) (integral cube 0 1 0.01 sum-i))
(= (sum-cube 1 10 sum-r) (sum-cube 1 10 sum-i))
(< (- (* 8 (pi-sum 1 1000 sum-r)) (* 8 (pi-sum 1 1000 sum-i))) 0.0001)
