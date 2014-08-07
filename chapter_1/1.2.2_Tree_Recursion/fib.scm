(define (fib-r n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-r (- n 1))
                 (fib-r (- n 2))))))

(fib-r 9)

(define (fib-i-01 n)
  (define (iter x y z)
    (if (= z 0)
        y
        (iter (+ x y) x (- z 1))))
  (iter 1 0 n))

(define (fib-i-02 n)
  (define (iter x y z)
    (if (= z n)
        y
        (iter (+ x y) x (+ z 1))))
                                    
  (iter 1 0 0))

(= (fib-r 9) (fib-i-02 9) (fib-i-01 9))
