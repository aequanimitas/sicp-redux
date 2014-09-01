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
    (let ((next (f guess)))
         (if (close-enough? guess next)
             next
             (try next))))
  (try first-guess))

(fixed-point cos 1.0)

((lambda (x y) (< (abs (- x y)) ((lambda () 0.00001)))) 0 1) 
