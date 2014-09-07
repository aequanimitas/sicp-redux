(define (linear-combination a b x y)
  (+ (* a x) (* b y)))
  
; 2.1 Intro

(define (make-rational-basic n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(make-rational-basic 1 3)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  x)

(print-rat (make-rational-basic 1 3))

(define (make-rational-lowest-terms n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(print-rat (make-rational-lowest-terms 20 4))

(define (add-rat x y)
  (make-rational-lowest-terms (+ (* (numer x) (denom y)) (* (denom x) (numer y))) (* (denom x) (denom y))))

(print-rat (add-rat (make-rational-lowest-terms 1 3) (make-rational-lowest-terms 1 3)))

(print-rat (make-rational-basic -10 99))

; Exercise 2.1
(define (mr n d)
  (cond ((and (> n 0) (< d 0)) (mr (* -1 n) (* -1 d)))
        ((and (< d 0) (< n 0)) (mr (* -1 n) (* -1 d)))
        (else (let ((g (gcd n d)))
              (cons (/ n g) (/ d g))))))
   
(mr -1 -3)
(mr 1 -3)
(mr -1 3)

; exercise 2.2

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  0)

(make-point 3 -2)
(start-segment ex2.2.01)
(print-point (make-point -3 19))
(start-segment ex2.2.01)
(midpoint ex2.2.01)

(define (make-point x y)
  (cons x y))

(define (make-segment x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (car x))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cons x))

(define ex2.2.01 (make-segment (make-point -3 19) (make-point -4 27)))

(define (midpoint a)
  (make-rational-basic (/ (+ (car (car a)) (car (cdr a))) 2.0) (/ (+ (cdr (car a)) (cdr (cdr a))) 2)))

; Exercise 2.3
(define (is-right-angle? x y z)())
(define (rectangle w x y z)())
  
(define ex2.3.01 (make-segment (make-point -3 19) (make-point -4 27)))
(midpoint ex2.3.01)
; 2.1.3
(define (cons-y x y)
  (define (dispatch m)
     (cond ((= m 0) x)
           ((= m 1) y)
           (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car-y z) (z 0))
(define (cdr-y z) (z 1))

(define lol (cons-y "a" "b"))
(car-y lol)
(car-y lol)
