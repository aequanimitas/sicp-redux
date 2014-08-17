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

(defun mult (a b eval-count)
  (cond ((= b 0)
        (logger "eval count: " eval-count)
        0)
        ((even? b) (dub (mult a (/ b 2) (+ eval-count 1))))
        ((not (even? b)) (+ a (mult a (- b 1) (+ eval-count 1))))))

(logger "equal?: " (= 8 (dub 4)))

(logger "value: " (mult 2 4 0))
(logger "value: " (mult 2 3 0))
(logger "value: " (mult 2 6 0))
(logger "value: " (mult 3 5 0))
(logger "value: " (mult 332 2037819 0))
