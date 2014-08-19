(defun smallest-divisor (x)

  (defun divides? (x y)
    (= 0 (mod y x)))

  (defun find-divisor (x y)
     (cond ((> (* y y) x) x)
           ((divides? y x) y)
           (t (find-divisor x (+ 1 y)))))

  (find-divisor x 2))

(defun prime? (x)
  (= x (smallest-divisor x)))

(defun newline()
  (format t "~%"))

(defun timed-prime-test (n)
  (defun report-prime (elapsed-time)
    (newline)
    (format t " *** ")
    (format t " Time: ")
    (format t "~A" elapsed-time))

  (defun looper (n c rt)
    (cond ((> c 3)
            (newline)
            (format t "DONE!")
            (report-prime (- (get-internal-run-time) rt)))
          ((prime? n)
            (newline)
            (format t "~A: " c)
            (format t "~A" n)
            (looper (+ n 2) (+ c 1) rt))
          (t (looper (+ n 1) c rt))))
  (looper n 1 (get-internal-run-time)))


(timed-prime-test 1000)
(timed-prime-test 10000)
(timed-prime-test 100000)
(timed-prime-test 1000000)
(timed-prime-test 10000000)
