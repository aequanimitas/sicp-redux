(define slist (list 1 2 3 4))
(define slist-cons (cons 1 (cons 2 (cons 4 (cons 4 '())))))
(define strlist "lol")

(define (len-i lst)
  (define (iter x y)
    (if (equal? y `())
        x
        (iter (1+ x) (cdr y))))
  (iter 0 lst))

(len-i slist)
(len-i slist-cons)

; handling strings while creating own, worse barrier
(define (to-list str . seperator)
  (define (iter c l-list)
    (if (=  c (string-length str))
        l-list
        (iter (1+ c) (cons (string-ref str c) l-list))))
  (iter 0 (list)))



(equal? #\l (car (to-list strlist)))
