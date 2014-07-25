(define (sq x)  (* x x))
(define (max x y z)
  (cond ((and (> x y) (> z y)) (list x z))
        ((and (> y z) (> x z)) (list x y))
        ((and (> y x) (> z x)) (list y z))
        (else 0)))

(define (start x y z)
  (+ (sq (car (max x y z))) (sq (car (cdr (max x y z))))))

(start 1 2 3)
