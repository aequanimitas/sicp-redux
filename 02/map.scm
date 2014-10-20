(define (maps proc seq)
  (if (null? seq)
      seq
      (cons (proc (car seq)) (maps proc (cdr seq)))))

(define (maps-l proc seq)
  (if (null? seq)
      seq
      (list (proc (car seq)) (maps proc (cdr seq)))))

(define (maps-i proc seq)
  (define (iter c i a)
    (if (= c 0)
        a
        (iter (- c 1) (cdr i) (cons (proc (car i)) a))))
  (iter (length seq) seq ()))

(define (maps-il proc seq)
  (define seq-len (length seq))
  (define (iter c i a)
    (if (= c seq-len)
	a
	(iter (+ c 1) (cdr i) (list a (proc (car i))))))
  (iter 0 seq ()))

(maps square (list 2 3 4 5))
(maps-l square (list 2 3 4 5))
(maps-i square (list 2 3 4 5))
(maps-il square (list 2 3 4 5))
