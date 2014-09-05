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
