(defun cube (x) (* x x x))

(defun p (x)
  (- (* 3 x))
     (* 4 (cube x)))

(defun sine (angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
