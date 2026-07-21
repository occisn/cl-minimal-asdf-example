;;;; Entry point of the system.

(in-package :cl-my-project2)

(defparameter *greeting* "Hello world!"
  "Text printed by MAIN before anything else.")

(defun main ()
  "Print a short demonstration of the functions defined in this system."
  (format t "~a~%" *greeting*)
  (format t "Double of 3 is ~a.~%" (double 3))
  (format t "Triple of 3 is ~a.~%" (triple 3))
  (dolist (n '(3 7 20))
    (format t "~a is ~:[not ~;~]small, and ~:[not ~;~]worth doubling.~%"
            n (smallp n) (worth-doubling-p n)))
  (values))
