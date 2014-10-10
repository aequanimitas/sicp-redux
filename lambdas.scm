((lambda (x) (+ 3 x)) 4)

; wrapping this sample code
(((lambda (f)
   (lambda (x)
     (f f x))
   )
 (lambda (fact x)
   (if (= x 0) 
       1 
       (* x (fact fact (- x 1)))))) 5) 

(((lambda (f)
  (lambda (x)
    (f f x)))) square 5)

(define (compose fnx fny)
  (lambda (x) (fnx (fny x))))

((compose square 1+) 6)

(define (repeated fnx x null-est step)
  (if (null-est x)
      fnx
      (compose 
         fnx 
         (repeated 
           fnx 
           (step x)
           null-est
           step
           ))))

(cdr (cdr (list 1 2 3)))
(equal? (cdr (cdr (cdr (list 1 2 3)))) `())

((repeated 
    square 
    2 
    (lambda (x) (= x 1))
    (lambda (x) (- x 1)))
  5)
