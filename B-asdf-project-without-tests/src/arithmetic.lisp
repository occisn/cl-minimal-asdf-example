;;;; Arithmetic helpers and the predicates built on top of them.

(in-package :cl-my-project1)

;;; Constants
;;;
;;; Constants wear +plus-signs+, special variables wear *earmuffs*.

(defconstant +small-threshold+ 10
  "Integers strictly below this are considered small.")

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
