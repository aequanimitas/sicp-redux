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
          (else (iter (- (halve y) 1) (+ (dub a) a) (+ eval-count 1)))))
  (iter b 0 0))

(* 2 8)
