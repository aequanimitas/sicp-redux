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

(define (rev l)
  (repeater null? l cdr cons car (list) identity))

; linear runtime, improve
(define (nth l i)
  (define len-l (len l))
  (repeater (lambda (x) (= (- len-l (len x)) i))
            l
            cdr
            (lambda (x y) x)
            car
            0
            identity))

(define (map-to proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (map-hop proc items)
  (repeater null? items cdr cons (lambda (x) (proc (car x)))  (list) rev))
