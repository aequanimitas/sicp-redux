(define (average x y)
  (/ (+ x y) 2))

(define (better-approximation x y)
  ; x is the radicant
  ; y is the guess
  (average y (/ x y)))

(better-approximation 9 3)
