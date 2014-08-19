(defun smallest-divisor (x)

  (defun divides? (x y)
    (= 0 (mod y x)))

  (defun find-divisor (x y)
     (cond ((> (* y y) x) x)
           ((divides? y x) y)
           (t (find-divisor x (+ 1 y)))))

  (find-divisor x 2))

(format t "~%Smallest divisor of 199: ~A" (smallest-divisor 199))
(format t "~%Smallest divisor of 1999: ~A" (smallest-divisor 1999))
(format t "~%Smallest divisor of 19999: ~A" (smallest-divisor 19999))
(format t "~%Smallest divisor of 1997: ~A" (smallest-divisor 1997))
