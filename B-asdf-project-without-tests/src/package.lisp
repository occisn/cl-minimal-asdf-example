;;;; Package definition for the whole system.
;;;;
;;;; One package covers all the source files here, which is the usual choice
;;;; for a system this small.  A larger project would define one package per
;;;; file, with hierarchical names: cl-my-project1.arithmetic, and so on.

(defpackage :cl-my-project1
  (:use :cl)
  (:export #:main
           #:triple
           #:smallp
           #:worth-doubling-p)
  (:documentation "Minimal ASDF project, without tests."))
