(define (range start end . step)

  (define (step-down step)
    (< (car step) 0))
        
  (define (iter start end accum oper)
    (if (= end 0)
        (reverse accum)
        (iter (oper (if (not (eq? step ()))
                       (car step)
                       1) start) 
              (- end 1) 
              (cons start accum)
              oper)))

  (cond ((and (> start end) (step-down step)) (iter start end () -))
        ((or (and (> start end) (not (step-down step)))
             (and (< start end) (step-down step))) ())
        (else (iter start end () +))))

(range 1 10 20)
(range 1100 10 20)

