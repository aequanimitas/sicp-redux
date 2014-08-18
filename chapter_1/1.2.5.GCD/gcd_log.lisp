(defun gcdee (x y)
  (if (= y 0)
      x
      (gcdee y (mod x y))))

(format t "~%~A" (gcdee 109098 1279))
(format t "~%~A" (gcdee 206 40))
