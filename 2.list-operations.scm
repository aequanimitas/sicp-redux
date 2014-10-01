(define sample-list (list 1 2 3 4 5))

(define (len x)
  (define (iter y z)
    (if (equal? y '())
        z
        (iter (cdr y) (+ z 1))))
  (iter x 0))

(define (nth n x)
  (if (= n 0)
      (car x)
      (nth-rd (- n 1) (cdr x))))

(define (last x)
  (if (equal? (cdr x) '())
      (car x)
      (last (cdr x))))
  
(len sample-list)

(nth 0 sample-list)
(last sample-list)

(list (cons 1 (cons 2 3)))
