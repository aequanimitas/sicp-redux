(defun factorial (x)
  (if (= x 1)
      0
      (* x (factorial (- x 1)))))

(factorial 9)
