(define (sqrt x)
  (define (average a b)
    (/ (+ a b) 2.0))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (good-enough? guess previous-guess threshold)
    (< (abs (- guess previous-guess)) threshold))
  (define (iter x guess previous-guess threshold)
    (if (good-enough? guess previous-guess threshold)
        guess
        (iter x (improve guess x) guess threshold)))
  (iter x 1 0 0.0001))
(sqrt 10000)
(sqrt 0.001)
