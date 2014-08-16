(define (* a b)
  (define (halve x)
    (/ x 2))

  (define (dub x)
    (+ x x))

  (define (is-even? x)
    (= (remainder (/ x 2)) 0))

  (define (is-odd? x)
    (not (is-even? x)))
  (define (iter y accumulator eval-count)
    (cond ((= y 0)
            (newline)
            (display "Evaluation counter: ")
            (display eval-count)
            accumulator)
          (is-odd? (iter (- y 1) (+ accumulator a) (+ eval-count 1)))
          (is-even? (iter (halve y) (dub a) (+ eval-count 1)))))

  (iter b 0 0))

(define (generate-multiples x y)
  (define (iter w state)
    (newline)
    (display state)
    (if (> w y)
        state
        (iter (+ w 1) (* x w))))
  (iter 0 0))

(* 2 8)
