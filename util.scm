; naive implementation of average, but limiting myself for now in just using 
; 2 arguments
(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define tolerance 0.0001)
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

(define (better-display x)
  (newline)
  (display x))
