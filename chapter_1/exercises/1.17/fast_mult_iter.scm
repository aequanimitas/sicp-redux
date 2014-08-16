(define (mult a b)
  (define (halve x)
    (/ x 2))

  (define (dub x)
    (+ x x))

  (define (is-even? x)
    (= (remainder x 2) 0))

  (define (is-odd? x)
    (not (is-even? x)))

  (define (iter y accumulator eval-count)
    (cond ((= y 0) accumulator)
          ((is-odd? y) (iter (- y 1) (+ accumulator a) (+ eval-count 1)))))
          ((is-odd? y) (iter (- y 1) (+ accumulator a) (+ eval-count 1)))))

  (iter b 0 0))

(mult 2 1)
