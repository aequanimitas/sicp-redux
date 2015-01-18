(define (fib n)
  (if (= n 0)
      1
      (* n (fib (- n 1)))))

(fib 5)

; let's transform this to a lambda, so we can remove
; human-readable references

(lambda (n)
  (if (= n 0)
      (* n (fib (- n 1)))))

; now, we need a way to call the procedure again
; but how? we need to refer again without directly
; using the common way to reference a procedure


