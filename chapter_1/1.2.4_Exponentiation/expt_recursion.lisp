(defun expo (base exp)
  (if (= exp 0)
      1
      (* base (expo base (- exp 1)))))

(format t "~A" (expo 9 3))
