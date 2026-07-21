;;;; Package definition for the test suite.
;;;;
;;;; The test package does NOT :use the package under test.  Listing what it
;;;; needs with :import-from keeps the origin of every symbol visible, and is
;;;; the only way to reach DOUBLE, which cl-my-project2 does not export --
;;;; :import-from works on internal symbols just as well as on exported ones.
;;;;
;;;; The alternative, when only a couple of internal symbols are involved, is
;;;; to write cl-my-project2::double at the point of use.

(defpackage :cl-my-project2-tests
  (:use :cl)
  (:import-from :cl-my-project2
                #:double
                #:triple
                #:smallp
                #:worth-doubling-p)
  (:documentation "Test suite for cl-my-project2."))
