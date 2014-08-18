(defun smallest-divisor (x)

  (defun divides? (x y)
    (= 0 (mod y x)))

  (defun find-divisor (x y)
     (cond ((> (* y y) x) x)
           ((divides? y x) y)
           (t (find-divisor x (+ 1 y)))))

  (find-divisor x 2))

(defun prime? (x)
  (= x (smallest-divisor x)))

(format t "~%Prime?: ~A" (prime? 7919))
