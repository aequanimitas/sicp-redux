; 1.1.2
(define size 2)
(display size)

; context
(define (one-1.3)
  (define (context y)
    (define y 10)
    (display y))
  (context 9))

; exercise 1.31
(define (sum-range-i x y term next)
  (define (iter a result)
    (if (> a y)
        result
        (iter (next a) (+ (term a) result))))
  (iter x 0))

(define (sum-range-r x y term next)
  (if (> x y)
      0
      (+ (term x) (sum-range-r (next x) y term next))))

(define (product-range-i x y term next)
  (define (iter a result)
    (if (> a y)
        result
        (iter (next a) (* (term a) result))))
  (iter x 1))

(define (product-range-r x y term next)
  (if (> x y)
      1
      (* (term x) (product-range-i (next x) y term next))))

(define (increment x)
  (+ x 1))

(define (identity x)
  x)

(define (cube x)
  (* x x x))

(sum-range-i 1 5 identity increment)


(= (sum-range-i 2 3 identity increment) (sum-range-r 2 3 identity increment))
(= (sum-range-i 2 3 square increment) (sum-range-r 2 3 square increment))
(= (sum-range-i 2 3 cube increment) (sum-range-r 2 3 cube increment))
(= (product-range-i 2 3 cube increment) (product-range-i 2 3 cube increment))
(= (product-range-i 2 3 square increment) (product-range-i 2 3 square increment))
(= (product-range-i 2 3 identity increment) (product-range-i 2 3 identity increment))


; exercise 1.32
(define (accumulate-r x y term next combiner null-value)
  (if (> x y)
      null-value
      (combiner (term x) (accumulate-r (next x) y term next combiner null-value))))

(define (accumulate-i x y term next combiner null-value)
  (define (iter a result)
    (if (> a y)
      result
      (iter (next a) (combiner (term a) result))))
  (iter x null-value))

(= (sum-range-i 2 3 identity increment) (accumulate-i 2 3 identity increment + 0))
(= (sum-range-i 2 3 square increment) (accumulate-i 2 3 square increment + 0))
(= (sum-range-i 2 3 cube increment) (accumulate-i 2 3 cube increment + 0))
(= (product-range-i 2 3 cube increment) (accumulate-i 2 3 cube increment * 1))
(= (product-range-i 2 3 square increment) (accumulate-i 2 3 square increment * 1))
(= (product-range-i 2 3 identity increment) (accumulate-i 2 3 identity increment * 1))


(= (sum-range-r 2 3 identity increment) (accumulate-r 2 3 identity increment + 0))
(= (sum-range-r 2 3 square increment) (accumulate-r 2 3 square increment + 0))
(= (sum-range-r 2 3 cube increment) (accumulate-r 2 3 cube increment + 0))
(= (product-range-i 2 3 cube increment) (accumulate-r 2 3 cube increment * 1))
(= (product-range-i 2 3 square increment) (accumulate-r 2 3 square increment * 1))
(= (product-range-i 2 3 identity increment) (accumulate-r 2 3 identity increment * 1))

(define (filtered-accumulate-i x y term next combiner null-value filter-cond)
  (define (iter a result)
    (cond ((> a y) result)
          ((filter-cond a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter x null-value))

(define (smallest-divisor x y)
  (define (find-divisor endpoint startpoint)
    (cond ((> (square startpoint) endpoint) endpoint)
          ((divides? endpoint startpoint) startpoint)
          (else (find-divisor endpoint (+ startpoint 1)))))
  (define (divides? endpoint startpoint)
    (= (remainder endpoint startpoint) 0))
  (find-divisor x y))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (primes-sum-square-range x y)
  (filtered-accumulate-i x y square increment + 0 prime?))

(primes-sum-square-range 6 7)

(define (are-coprimes? x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (define (fn z fun)
    (fun z))
  (fn x co-prime?))

(are-coprimes? 6 36)
(are-coprimes? 5 36)

(define (is-a-co-prime? x)
  (= 1 (gcd x y)))

(define (product-of-coprimes-fn-scope x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 is-a-co-prime?))

(product-of-coprimes-fn-scope 2 3)

(define (product-of-coprimes x y)
  (define (co-prime? x)
    (= 1 (gcd x y)))
  (filtered-accumulate-i x y identity increment * 1 co-prime?))

(product-of-coprimes 2 3)


(sum-range-i 1 7 identity increment)
(sum-range-i 1 6 identity increment)


; half interval method
; similar to DAC

; make this more flexible with the number of arguments it can handle
; nearer to actual average definition

(define (average x y)
  (/ (+ x y) 2))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
           (cond ((positive? test-value) (search f neg-point midpoint))
                 ((negative? test-value) (search f midpoint neg-point))
                 (else midpoint))))))

(search sin 4.0 2.0)

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
        (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
              ((and (negative? b-value) (positive? a-value)) (search f b a))
              (else error "Values are not opposite sign: " a b))))

(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)

(half-interval-method sin 2.1 0.1)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
         (if (close-enough? guess next)
             next
             (try next))))
  (try first-guess))

(fixed-point cos 1.0)

; close-enough procedure        ; tolerance constant
((lambda (x y) (< (abs (- x y)) ((lambda () 0.00001)))) 0 1)

; sum of "fn" of two numbers
((lambda (x y fn) (+ (fn x) (fn y))) 0.3 0.43 square)

   
((lambda (x) ((lambda (x y) (/ (+ x y) 2.0)) x (/ x x))) 1.0)

; (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

; (define (sqrt-avg x)
; (fixed-point (lambda (y) (average y (/ x y))) 1.0))

;(sqrt-avg 9)
;(define (sqrt-ratio x)
;  (fixed-point (lambda (y) (/ x y)) 1.0))

;(sqrt-ratio 9)


; exercise 1.36
(define (fixed-point-1.3 f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess display-counter)
    (let ((next (f guess)))
         (cond ((close-enough? guess next)
             (newline)
             (display "High-Level Operation Count: " )
             (display display-counter)
             next)
             (else (try next (+ 1 display-counter))))))
  (try first-guess 0))

(fixed-point-1.3 (lambda (x) (/ (log 1000) (log x))) 2.0)
(fixed-point-1.3 (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))

(define (raise x y z)
  (if (= y 0)
      z
      (raise x (- y 1) (* x z))))

(/ (raise golden-ratio 20 1.0) (sqrt 5))

; Exercise 1.35
(fixed-point-1.3 (lambda (x) (+ 1 (/ 1 x))) golden-ratio)

; converting this to its most basic form
(define (sqrt-naive-creator x y z)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess previous-guess)
    (< (abs (- guess previous-guess)) 0.001))
  (define (newton-sqrt-find guess previous-guess)
    (newline)
    (display guess)
    (newline)
    (display previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (newton-sqrt-find (improve guess) guess)))
  (newton-sqrt-find y z))

(sqrt-naive-creator 9 1.0 0.0)

; identity
((lambda (fn) fn)((lambda (fn) fn)((lambda (x y) (/ (+ x y) 2)) 10 100)))


(load "util")
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (average y (/ x (square y))))) 1.0))

(cube-root 125)

; exercise 1.41
(define (double fn)
  (lambda (x) (fn (fn x))))

(define (inc x)
  (+ 1 x))

(((double (double double)) inc) 5)

; exercise 1.42
(define (compose fnx fny)
  (lambda (x) (fnx (fny x))))

((compose square (lambda (x) x)) 6)
((compose square inc) 6)
((compose inc square) 6)

; exercise 1.43
(define (repeated fnx x)
  (if (= x 1)
      fnx
      (compose fnx (repeated fnx (- x 1)))))

((repeated square 2) 5)

; exercise 1.44
(define pi (/ (+ 1.0 (sqrt 5)) 2.0))

(define (smooth fnx dx)
  (lambda (x)
   (/ (+ (fnx x) (fnx (- x dx)) (fnx (+ x dx))) 3.0)))

((smooth sin 0.7) (/ pi 2))

(define testing-namespace
  (define one (1))
  (define two (2))
  one)

testing-namespace


; context, 1.1.3
(define (one-1.3)
  (define (context x y)
    (define x 11)
    (define y 10)
    (newline)
    (display y)
    (newline)
    (display x))
  (context 8 9))

(one-1.3)

; compound procedure
(define (one-1.4)
  (define (square x)
    (* x x))
  (define (sos x y)
    (+ (square x) (square y)))
  (sos 3 4))

(one-1.4)
