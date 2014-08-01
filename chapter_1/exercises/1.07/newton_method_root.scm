(define (average x y)
  (abs (/ (+ x y) 2.0)))

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
  ; 'watch guess in each iteration until the difference between two guesses are smaller than the threshold value
  (newline)
  (display (- guess previous-guess))
  (newline)
  (< (abs (- guess previous-guess)) 0.001))

(newton-sqrt-find 9 1.0 0.0)
