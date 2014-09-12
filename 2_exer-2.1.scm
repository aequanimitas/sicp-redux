; Exercise 2.1
(define (mr n d)
  (cond ((and (> n 0) (< d 0)) (mr (* -1 n) (* -1 d)))
        ((and (< d 0) (< n 0)) (mr (* -1 n) (* -1 d)))
        (else (let ((g (gcd n d)))
              (cons (/ n g) (/ d g))))))
   
(mr -1 -3)
(mr 1 -3)
(mr -1 3)
