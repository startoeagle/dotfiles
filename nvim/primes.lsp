(defvar true (not nil))
(defvar false (not true))

(defun primes (n)
  (labels ((aux (m candidate)
                (cond ((= 1 m)          nil)
                      ((<= (sqrt n) (- candidate 1))  nil)
                      ((= 0 (mod m candidate)) (cons candidate (aux (/ m candidate) candidate)))
                      (true                    (aux m (+ 1 candidate))))))
    (or (aux n 2) (list n))))

(defun prod (lst) (reduce #'* lst))
(defvar test-primes (list 2 3 54 4))
(prod (primes (prod test-primes)))

