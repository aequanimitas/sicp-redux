(define (mult a b)
  (define (halve x)
    (/ x 2))

  (define (dub x)
    (+ x x))

  (define (is-even? x)
    (= (remainder x 2) 0))

  (define (logger message value)
    (newline)
    (display message)
    (display value))

  (define (is-odd? x)
    (not (is-even? x)))

  (define (iter y eval-count)
    (cond ((= y 0) 0)
          ((is-odd? y) (+ a (iter (- y 1) (+ eval-count 1))))
          ((is-even? y) (dub (iter (halve y) (+ eval-count 1))))))

  (iter b 0))

(mult 2 1)
(mult 2 2)
(mult 2 3)
(mult 3 3)
(mult 3 5)
