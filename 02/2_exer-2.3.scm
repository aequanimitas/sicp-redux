; Exercise 2.3
(load "util_math.scm")
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
 
