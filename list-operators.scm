(define (repeater done? object process next step accumulator refine)
  (if (done? object)
      (refine accumulator)
      (repeater done? 
                (process object) 
                process 
                next 
                step 
                (next (step object) accumulator)
                refine)))
(define (identity x) x)
(define (len l)
  (repeater null? l cdr + (lambda (x) 1)  0 identity))

(len (list 1 2 3 4))

(define (rev l)
  (repeater null? l cdr cons car (list) identity))

(rev (list 1 2 3 4))

(define (nth l i)
  (define (iter x z)
    (if (= z i)
        (car x)
        (iter (cdr x) (- z 1))))
  (iter l (- (len l) 1)))

(nth (list 1 2 3 4) 3)
