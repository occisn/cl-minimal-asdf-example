;;;; A complete Common Lisp program in a single file.
;;;;
;;;; The simplest shape a program can take: one file holding the package
;;;; definition, the code, and the entry point.  There is no ASDF system, so
;;;; the file is loaded by compiling it directly -- C-c C-k in SLIME, or
;;;; (load (compile-file "one-file.lisp")) at the REPL.
;;;;
;;;; Once loaded, call (my-app:main).

(defpackage :my-app
  (:use :cl)
  (:export #:main
           #:triple
           #:smallp
           #:worth-doubling-p)
  (:documentation "A one-file demonstration program."))

(in-package :my-app)

;;; Compilation policy
;;;
;;; There is no .asd file here to carry the setting, so the policy is declaimed
;;; in the file itself.  Compiled with COMPILE-FILE, a file-level DECLAIM
;;; applies to the rest of this file only.  Projects B and C set their policy
;;; once for all their files, in the .asd.

(declaim (optimize (debug 3) (safety 3) (speed 0)))

;;; Constants and parameters
;;;
;;; Constants wear +plus-signs+, special variables wear *earmuffs*.

(defconstant +small-threshold+ 10
  "Integers strictly below this are considered small.")

(defparameter *greeting* "Hello world!"
  "Text printed by MAIN before anything else.")

;;; Arithmetic

(declaim (ftype (function (fixnum) fixnum) double triple))

(defun double (x)
  "Return twice the value of X.  Not exported: see the README on `::'."
  (* 2 x))

(defun triple (x)
  "Return three times the value of X."
  (* 3 x))

;;; Predicates
;;;
;;; A predicate ends in P when the rest of the name is a single word, and in
;;; -P when it is several words.

(defun smallp (x)
  "Return true if X is below +SMALL-THRESHOLD+."
  (< x +small-threshold+))

(defun worth-doubling-p (x)
  "Return true if X is small and doubling it keeps it small."
  (and (smallp x)
       (smallp (double x))))

;;; Entry point

(defun main ()
  "Print a short demonstration of every function defined here."
  (format t "~a~%" *greeting*)
  (format t "Double of 3 is ~a.~%" (double 3))
  (format t "Triple of 3 is ~a.~%" (triple 3))
  (dolist (n '(3 7 20))
    (format t "~a is ~:[not ~;~]small, and ~:[not ~;~]worth doubling.~%"
            n (smallp n) (worth-doubling-p n)))
  (values))
