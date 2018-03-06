(defvar *PI* 3.141592)

(defun square (n)
  (* n n))

(defun cube (n)
  (* n n n))

(defun sum (&rest nums)
  (let ((total 0))
    (dolist (num nums)
      (setf total (+ total num))
      (format t "Sum = ~a ~%" total)) total))

(defun factorial (n)
  (if (= n 0) 1
      (* n (factorial (- n 1)))))

(defun area-circle(rad)
  (format t "Radius: ~5f" rad)
  (format t "~%Area: ~10f" (* *PI* rad rad)))

(defun fizzBuzz (n)
  "Fizz buzz is a group word game..."
  (case n
        (15 "FizzBuzz")
        (3 "Fizz")
        (5 "Buzz")
        (otherwise "Not Fizz, Buzz or FizzBuzz")))
