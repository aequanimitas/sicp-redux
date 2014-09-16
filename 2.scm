(load "util_math.scm")

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

(define (exercise-2.5)
  (define (cons x y)
    (* (expt 2 x) (expt 3 y)))

  (define (not-integer? x y)
    (not (integer? (/ x y))))

  (define (base-prime x y null-value)
    (if (= x null-value)
        y
        (base-prime (/ x null-value) (+ y 1) null-value)))

  (define (car x)
    (if (not-integer? x 3)
        (base-prime x 1 2)
        (car (/ x 3))))

  (define (cdr x)
    (if (not-integer? x 2)
        (base-prime x 1 3)
        (cdr (/ x 2))))

  (newline)
  (display "Car: ")
  (display (car (cons 4 5)))
  (newline)
  (display "Cdr: ")
  (display (cdr 3888))

  (cons 4 5))

(exercise-2.5)

(define (exercise2.6)
  (define zero (lambda (f) (lambda (x) x)))
  (zero 1))
(exercise2.6)
