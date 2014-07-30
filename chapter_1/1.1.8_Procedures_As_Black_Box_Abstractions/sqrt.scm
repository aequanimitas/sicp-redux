(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess previous-guess)
    (< (abs (- guess previous-guess)) 0.001))
  (define (newton-sqrt-find guess previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (newton-sqrt-find (improve guess) guess)))
  (newton-sqrt-find 1.0 0))

(sqrt 0.001)
    
