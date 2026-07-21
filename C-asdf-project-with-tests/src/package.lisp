;;;; Package definition for the whole system.
;;;;
;;;; One package covers all the source files here, which is the usual choice
;;;; for a system this small.  A larger project would define one package per
;;;; file, with hierarchical names: cl-my-project2.arithmetic, and so on.
;;;;
;;;; DOUBLE is deliberately left unexported, so that the test suite has to
;;;; reach it the way test suites usually do -- see tests/package.lisp.

(defpackage :cl-my-project2
  (:use :cl)
  (:export #:main
           #:triple
           #:smallp
           #:worth-doubling-p)
  (:documentation "Minimal ASDF project, with tests."))
