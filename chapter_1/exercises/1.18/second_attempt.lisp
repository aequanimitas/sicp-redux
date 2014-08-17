(defun logger (message val)
  (format t "~%")
  (format t message)
  (format t "~A" val))

(defun halve (x)
  (/ x 2))

(defun dub (x)
  (+ x x))

(defun even? (x)
  (= (mod x 2) 0))

(defun mult (a b)
  (defun iter (x y acc)
    (cond ((= y 0) acc)
          ((even? y) (iter (dub x) (halve y) acc))
          (t (iter (dub x) (halve (- y 1)) (+ acc x)))))

  (format t "~%")
  (format t "~A multiplied by ~A" a b)
  (iter a b 0))

(logger "value: " (mult 2 0))
(format t "~%")

(logger "value: " (mult 2 2))
(format t "~%")

(logger "value: " (mult 2 3))
(format t "~%")

(logger "value: " (mult 57 86))
(format t "~%")
