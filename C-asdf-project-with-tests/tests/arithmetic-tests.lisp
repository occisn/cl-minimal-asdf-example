;;;; Tests for src/arithmetic.lisp.

(in-package :cl-my-project2-tests)

(parachute:define-test test-double
  (parachute:is = 8 (double 4))
  (parachute:is = 0 (double 0)))

(parachute:define-test test-triple
  (parachute:is = 12 (triple 4))
  (parachute:is = 0 (triple 0)))

(parachute:define-test test-smallp
  (parachute:true (smallp 3))
  (parachute:false (smallp 10)))       ; the threshold itself is not small

(parachute:define-test test-worth-doubling-p
  (parachute:true (worth-doubling-p 3))
  (parachute:false (worth-doubling-p 7))   ; small, but 14 is not
  (parachute:false (worth-doubling-p 20)))
