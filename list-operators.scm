(define (repeater at-limit? object process next step accumulator)
  (if (at-limit? object)
      accumulator 
      (repeater at-limit? 
                (process object) 
                process 
                next 
                step 
                (next (step object) accumulator))))

(define (len l)
  (repeater null? l (lambda (x) (cdr x)) + (lambda (x) 1)  0))

(len (list 1 2 3 4))

(define (rev l)
  (repeater null? l (lambda (x) (cdr x)) cons (lambda (x) (car x)) (list)))

(rev (list 1 2 3 4))
