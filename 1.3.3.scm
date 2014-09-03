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
