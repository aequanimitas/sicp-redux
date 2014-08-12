(defun expo-iter (base exp)
  (defun iterator (exponent product)
    (if (= exponent 0)
      product
      (iterator (- exponent 1) (* base product))))
  (iterator exp 1))

(format t "~A" (expo-iter 9 3))
