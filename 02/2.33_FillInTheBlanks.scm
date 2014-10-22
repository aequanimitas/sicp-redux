(define (accumulate initial combiner seq)
  (if (null? seq)
      initial
      (combiner (car seq) (accumulate initial combiner (cdr seq)))))

(define z (list 1 2 3 4 5))

; where does 13 come from????
(define (len-13 seq)
  (accumulate 0 (lambda (x y) 1+)) seq))

(define (maps proc seq)
  (accumulate '() (lambda (x y) (cons (proc x) y)) seq))

(define (len seq)
  (accumulate 0 (lambda (x y) (1+ y)) seq))

(maps square z)
(len z)
