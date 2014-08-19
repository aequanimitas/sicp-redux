(defun even? (x)
  (= (mod x 2) 0))

(defun fast-expt (x y)
  (cond ((= y 0) 1)
        ((even? x) 

