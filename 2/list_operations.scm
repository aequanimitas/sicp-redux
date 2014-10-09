(define slist (list 1 2 3 4))
(define slist-cons (cons 1 (cons 2 (cons 4 (cons 4 '())))))
(define strlist "lol")

(define (compose fnx fny)
  (lambda (x) (fnx (fny x))))

(define (repeated fnx x)
  (if (= x 1)
      fnx
      (compose fnx (repeated fnx (- x 1)))))

(define (last x . z)
  ((repeated cdr ((lambda() (- (len-i x) 1)))) x))

; 0-index
(define (nth n x)
  (if (= n 0)
      (car x)
      (nth (- n 1) (cdr x))))

(define (len-i lst)
  ((repeated cdr 
  (define (iter x y)
    (if (equal? y `())
        x
        (iter (1+ x) (cdr y))))
  (iter 0 lst))

(len-i slist)
(len-i slist-cons)

; handling strings while creating own, worse barrier
(define (to-list str . seperator)
  (define (iter c l-list z)
    (if (=  c z)
        l-list
        (iter (1+ c) (cons (string-ref str c) l-list) z)))
  (iter 0 (list) ((lambda () (string-length str)))))

(equal? #\l (car (to-list strlist)))

(= 3 (nth 2 slist))

((repeated square 2) 5)

(last slist)
