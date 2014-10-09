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

(define (repeated fnx x)
  (if (= x 1)
      fnx
      (compose fnx (repeated fnx (- x 1)))))
