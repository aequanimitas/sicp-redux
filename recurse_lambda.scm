(
  ((lambda (x) (x x)) (lambda (y)   
                       (lambda (z)
                         (if (= 0 z)
                             1
                             (* z ((y y) (- z 1)))))
                      )
  ) 
5)


; this is the correct implementation, our reference
(define (factorial x)
  (if (= x 0)
      1
      (* x (factorial (- x 1)))))

(factorial 5)

; what we need to do is "call" fact again, but this time, no direct reference
; to a procedure, and using only lambda
; of course, when invoked, the result would be undefined "fact"
; using the "eye-test", yes it looks like a factorial function
; but the "fact" is still baseless, and floating like a butterfly

(lambda (x)
  (if (= x 0)
      1
      (* x (fact (- x 1)))))

; let's add a new lambda that will handle the fact
; steps:
; - invoke the inner lambda first
 
(lambda (fact)
  (lambda (x)
    (newline)
    (display x)
    (if (= x 0)
        1
        (* x (fact (- x 1))))))
