(define (range start end)
  (define (iter start end accum)
    (if (= end 0)
        (reverse accum)
        (iter (+ 1 start) (- end 1) (cons start accum))))
  (iter start end ()))

(range 1 10)

