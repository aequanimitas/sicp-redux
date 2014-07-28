(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (better-guess guess x)
  (/ (+ guess (/ x guess)) 2))

; assume that 1 is the square root of all numbers'
; using decimal here (1.0) ensures us that all rational numbers yield to decimal ones
; though I know there's a lib to enforce evaluation in decimal

(define (start x)
  (sqrtn 1.0 x))

(define (good-enough? guess radicand)
  (< (abs (- (* guess guess) radicand)) 0.001))

(define (sqrtn guess radicand)
  (new-if (good-enough? guess radicand)
    guess
    (sqrtn (better-guess guess radicand) radicand)))

(start 9)
