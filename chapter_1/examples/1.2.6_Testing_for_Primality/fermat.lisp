(defun even? (x)
  (= (mod x 2) 0))

(defun sq (x)
  (* x x))

(defun expmod (base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (mod (sq (expmod base (/ exp 2) m)) m))
        (t (mod (* base (expmod base (- exp 1) m)) m))))

(defun fermat-test (n)
  (defun iter (c)
    (= (expmod c n n) c))
  (iter (+ 1 (random (- n 1)))))

(format t "~%~A" (fermat-test 7919))
