(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (mult a b ctr)
  (cond ((= b 0)
        (newline)
        (display ctr)
        0)
        ((even? b) (double (mult a (halve b) (+ ctr 1))))
        (else (+ a (mult a (- b 1) (+ ctr 1))))))

(mult 2 1000000 1)
