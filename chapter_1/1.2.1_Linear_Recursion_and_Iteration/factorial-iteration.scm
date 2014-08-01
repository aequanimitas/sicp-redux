(define (factorial x)
  (define (runner product counter)
     (if (> counter x)
         product
         (runner (* product counter) (+ counter 1))))
  (runner 1 1))

(factorial 9)
(disassemble factorial)
