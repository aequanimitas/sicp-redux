(defun fib (n)

  (defun even? (x)
    (= (mod x 2) 0))

  (defun iter (a b p q count)
    (cond ((= count 0) b)
          ((even? count)
             (iter a b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
          (t (iter
                   (+ (* b q) (* a q) (* a p))
                   (+ (* b p) (* a q))
                   p
                   q
                   (- count 1)))))
                    
  (iter 1 0 0 1 n)) 

(defun newline()
  (format t "~%"))

(newline)
(format t "~A" (fib 10))
