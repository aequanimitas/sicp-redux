(define (range start end . step)
  (define (iter start end accum)
    (if (= end 0)
        (reverse accum)
        (iter (+ (if (not (eq? step ()))
                       (car step)
                       1) start) (- end 1) (cons start accum))))
  (if (> start end)
      ()
      (iter start end ())))

(range 1 10 20)
(range 1100 10 20)

