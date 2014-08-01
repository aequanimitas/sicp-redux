(define (factorial z)
  (if (= z 1)
    z
    (* z (factorial (- z 1)))))

(factorial 9)
