(define (fib-r n)
  (newline)
  (display n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-r (- n 1))
                 (fib-r (- n 2))))))

(fib-r 5)

(define (fib-i-02 n)
  (define (iter x y z)
    (if (= z 0)
        y
        (iter (+ x y) x (- z 1))))
                                    
  (iter 1 0 n))

(= (fib-r 9) (fib-i-02 9))

(fib-i-02 5)
