(defun p () (p))

(defun a (b c)
  (if (= b 0)
    0
    c))

(format t "~A" (a 0 p))
