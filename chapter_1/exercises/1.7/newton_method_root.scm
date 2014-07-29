(define (average x y)
  (/ (+ x y) 2))

(define (better-approximation x y)
  ; x is the radicant
  ; y is the guess
  (average y (/ x y)))

(define (newton-sqrt-find x guess)
  (if (approximation-threshold? x guess)
      guess
      (newton-sqrt-find x (better-approximation x guess))))
      
(define (approximation-threshold? x guess)
  ; 0.001 is our threshold
  (< (abs (- (* guess guess) x)) 0.001))

(newton-sqrt-find 0.001 1.0)
