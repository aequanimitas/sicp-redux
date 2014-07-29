(define (average x y)
  (/ (+ x y) 2))

(define (better-approximation x y)
  ; x is the radicant
  ; y is the guess
  (average y (/ x y)))

(define (newton-sqrt-find x guess previous-guess)
  (if (approximation-threshold? guess previous-guess)
      guess
      (newton-sqrt-find x (better-approximation x guess) guess)))
      
(define (approximation-threshold? guess previous-guess)
  ; 0.001 is our threshold
  ; 'watch guess in each iteration until the threshold is so small'
  (< (abs (- guess previous-guess)) 0.001))

(newton-sqrt-find 0.001 1.0 0.0)
