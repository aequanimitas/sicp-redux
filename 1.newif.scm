(define-syntax subtract
  (syntax-rules ()
    ((subtract)
     #f)
    ((subtract a)
     a)
    ((subtract a b)
      (let ((temp (> a b)))
        (if temp
            (- a b)
            (- b a))))))

(subtract)
(subtract 10)
