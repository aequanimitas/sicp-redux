; half interval method
; similar to DAC

; mkae this more flexible with the number of arguments it can handle
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


