(defun fei (base exponent)
  (defun even? (x)
    (= (mod x 2) 0))
  (defun odd? (x)
    (not (even? x)))
  (defun square (x)
    (* x x))
  (defun logger(exp acc)
    (format t "Accumulator: ~A~%" acc)
    (format t "Exponent: ~A~%" exp)
    (format t "~%"))

  (defun itr (exp acc base)
    (logger exp acc)
    (cond ((= exp 0) acc)
          ((even? exp) (itr (/ exp 2) acc (square base)))
          ((odd? exp) (itr (- exp 1) (* acc base) base))))
  (itr exponent 1 base))

(format t "~A" (fei 2 10))
