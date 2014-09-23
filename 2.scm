(load "util_math.scm")
(load "util.scm")

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
  (define (inc x)
    (+ x 1))
  (define zero (lambda (f) (lambda (x) x)))
  (define one  (lambda (f) (lambda (x) (f x))))
  (define two  (lambda (f) (lambda (x) (f (f x)))))
  (newline)
  (display ((one inc) 9))
  (newline)
  (display ((two inc) 9)))
(exercise2.6)

(define (prettier-print x y)
  (newline)
  (display x)
  (display y)
  (newline))

(define (exercise-2.1.4)
  (define (make-interval a b)
    (cons a b))
  (define (upper-bound x)
    (cdr x))
  (define (lower-bound x)
    (car x))
  (define (sub-interval a b)
    (make-interval (- (lower-bound a) (lower-bound b)) (- (upper-bound a) (upper-bound b))))
  (define (interval-width x)
    (/ (- (upper-bound x) (lower-bound x)) 2))
  (prettier-print "Interval 10->20: " (interval-width (make-interval 10 20)))
  (prettier-print "Interval 10->30: " (interval-width (make-interval 10 30)))
)

(exercise-2.1.4)

; 2.2.1 Closure Prop and Hierarchical Data
(define (basic-2.2.1)

  (define one-through-four (list 1 2 3 4))
  (define one-through (list 1))
  (better-display (cdr one-through-four))
  (better-display (car (cdr (cdr one-through-four))))
  (better-display (car (cdr one-through-four)))
  (better-display (cons 99 one-through-four)))
  ; (better-display (cdr one-through))
  ; (better-display (car (car one-through))))

(basic-2.2.1)

(define (list-operations-2.2.1)

  (define (list-refs-i items n)
    (if (= n 0)
        (car items)
        (list-refs-i (cdr items) (- n 1))))

  (define (len-i items)
    (define (iter itemz n)
      (if (null? itemz)
          n
          (iter (cdr itemz) (+ n 1))))
    (iter items 0))

  (define (len-r items)
    (if (null? items)
        0
        (+ 1 (len-r (cdr items)))))

  (define (append-r list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append-r (cdr list1) list2))))


  (define cubes (list 1 8 27 56 125))
  (define odds (list 1 3 5 7 9 11 13))
  (better-display (list-refs-i cubes 4))
  (better-display (len-i cubes))
  (better-display (append-r cubes odds))
  0)

(list-operations-2.2.1)

(define (exercise-2.17)

  (define (len-i items)
    (define (iter itemz n)
      (if (null? itemz)
          n
          (iter (cdr itemz) (+ n 1))))
    (iter items 0))

  (define items (list 1 2 3 4 5))
  (define items-length (len-i items))

  (define (last-pair it il)
    (if (= il 1)
        (car it)
        (last-pair (cdr it) (- il 1))))

  (better-display (last-pair items items-length))) 
(exercise-2.17)

(define (exercise-2.18)
  (define (reverse-list items)
    (define (iter i l)
      (if (null? i)
          l
          (iter (cdr i) (cons (car i) l))))
    (iter (cdr items) (list (car items))))
  (better-display (reverse-list (list 1 2 3 4 5 199 200))))

(exercise-2.18)
