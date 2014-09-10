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
  (cdr x))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define ex2.2.01 (make-segment (make-point -3 19) (make-point -4 27)))

(define (midpoint a)
  (make-rational-basic (/ (+ (car (car a)) (car (cdr a))) 2.0) (/ (+ (cdr (car a)) (cdr (cdr a))) 2)))

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


; Exercise 2.3

(define (point-distance x y fn)
  (square (- (fn y) (fn x))))
(y-point (make-point -4 27))
(define e2.3-rect-p1 (make-point 0 0))
(define e2.3-rect-p2 (make-point 0 3))
(define e2.3-rect-p3 (make-point 6 0))
(define e2.3-rect-p4 (make-point 6 3))
(define ex2.3.02 (make-segment e2.3-rect-p1 e2.3-rect-p2))
(point-distance (start-segment ex2.3.02) (end-segment ex2.3.02) x-point)
(point-distance (start-segment ex2.3.02) (end-segment ex2.3.02) y-point)

(define (y-distance x y)
  (point-distance x y y-point))

(define (x-distance x y)
  (point-distance x y x-point))

(define (db2p x y)
  (sqrt (+ x y)))

(define e2.3-p2p1 (db2p (x-distance e2.3-rect-p2 e2.3-rect-p1) (y-distance e2.3-rect-p2 e2.3-rect-p1)))
(define e2.3-p3p2 (db2p (x-distance e2.3-rect-p3 e2.3-rect-p2) (y-distance e2.3-rect-p3 e2.3-rect-p2)))
(define e2.3-p3p1 (db2p (x-distance e2.3-rect-p3 e2.3-rect-p1) (y-distance e2.3-rect-p3 e2.3-rect-p1)))
(define e2.3-p4p3 (db2p (x-distance e2.3-rect-p4 e2.3-rect-p3) (y-distance e2.3-rect-p4 e2.3-rect-p3)))
(define e2.3-p4p1 (db2p (x-distance e2.3-rect-p4 e2.3-rect-p1) (y-distance e2.3-rect-p4 e2.3-rect-p1)))
(define e2.3-p4p2 (db2p (x-distance e2.3-rect-p4 e2.3-rect-p2) (y-distance e2.3-rect-p4 e2.3-rect-p2)))

(> e2.3-p3p2 e2.3-p3p1)
(> e2.3-p3p2 e2.3-p2p1)

e2.3-p3p2
e2.3-p3p1
e2.3-p2p1
(= e2.3-p4p3 e2.3-p2p1)
(define (right-triangle? p1 p2 p3)
  (define (round-square x) (round (square x)))
  (if (and (> p3 p2) (> p3 p1))
      (= (round-square p3) (+ (round-square p2) (round-square p1)))
      #f))

(right-triangle? e2.3-p2p1 e2.3-p3p1 e2.3-p3p2)
(right-triangle? e2.3-p3p1 e2.3-p4p3 e2.3-p4p1)
(right-triangle? e2.3-p4p2 e2.3-p4p3 e2.3-p3p2)
(right-triangle? e2.3-p4p2 e2.3-p2p1 e2.3-p4p1)

; there's something easier
(define (opposite-sides-equal? p1 p2)
  (= p1 p2))

(opposite-sides-equal? e2.3-p2p1 e2.3-p4p3)
(opposite-sides-equal? e2.3-p4p2 e2.3-p3p1)

(define (rectangle n-side s-side e-side w-side)
  (if (and (opposite-sides-equal? n-side s-side) (opposite-sides-equal? e-side w-side))
      (cons n-side w-side)
      0))

(define (area-rect x)
  (* (car x) (cdr x)))

(define (perimeter-rect x)
  (* 2 (+ (car x) (cdr x))))

(rectangle e2.3-p2p1 e2.3-p4p3 e2.3-p4p2 e2.3-p3p1)

(area-rect (rectangle e2.3-p2p1 e2.3-p4p3 e2.3-p4p2 e2.3-p3p1))
(perimeter-rect (rectangle e2.3-p2p1 e2.3-p4p3 e2.3-p4p2 e2.3-p3p1))
 
; exercise 2.4
(define (cons-2.4 x y)
  (lambda (m) (m x)))

(define (car-2.4 z)
  (z (lambda (p q) p)))

(define (cdr-2.4 z)
  (z (lambda (p q) q)))

(car-2.4 (cons-2.4 10 12))
(cdr-2.4 (cons-2.4 10 12))
