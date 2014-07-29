(define (average x y)
  (abs (/ (+ x y) 2.0)))

(define (better-cube-root-approximation x y)
  ; x is the radicant
  ; y is the guess
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (newton-cube-root-find x guess previous-guess)
  (if (approximation-threshold? guess previous-guess)
      guess
      (newton-cube-root-find x (better-cube-root-approximation x guess) guess)))
      
(define (approximation-threshold? guess previous-guess)
  ; 0.001 is our threshold
  ; 'watch guess in each iteration until the difference between two guesses are smaller than the threshold value
  (newline)
  (display (- guess previous-guess))
  (newline)
  (< (abs (- guess previous-guess)) 0.001))

(newton-cube-root-find 9 1.0 0.0)
