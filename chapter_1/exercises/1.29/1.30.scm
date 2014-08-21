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

(define (integral f a b dx sum-fn)
  (define (add-dx x) (+ x dx))
  (* (sum-fn f (+ a (/ dx 2.0)) add-dx b) dx))


