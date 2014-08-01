(define (show-shape x)
  (display x)
  (if (= x 0)
      (newline)
      (show-shape x)))

(define (factorial z)
  (if (= z 1)
    z
    (* z (factorial (- z 1)))))

(factorial 9)
