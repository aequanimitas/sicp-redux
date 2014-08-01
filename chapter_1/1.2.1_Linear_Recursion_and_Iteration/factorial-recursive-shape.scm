(define (show-shape x)
  (newline)
  (factorial x))

(define (factorial z)
  (if (= z 1)
    z
    (* z (factorial (- z 1)))))

(show-shape 9)
