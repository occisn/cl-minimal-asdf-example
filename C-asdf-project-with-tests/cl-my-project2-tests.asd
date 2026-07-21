(asdf:defsystem "cl-my-project2-tests"
  :version "0.1.1"
  :author "John Doe <john.doe@example.com>"
  :license "MIT"
  :description "Test suite for cl-my-project2."
  :depends-on ("cl-my-project2"
               "parachute")
  ;; Same remark as in cl-my-project2.asd: this PROCLAIM is global and is not
  ;; undone once the test system has been compiled.
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3) (safety 3) (speed 0)))
                    (funcall next))
  :components ((:module "tests"
                :serial t
                :components ((:file "package")
                             (:file "arithmetic-tests"))))
  ;; PARACHUTE:TEST returns a result object that is true whether the suite
  ;; passed or not, so its status has to be inspected explicitly.  Without
  ;; this, (asdf:test-system :cl-my-project2) would report success on a
  ;; failing suite, and so would any CI job built on it.
  :perform (asdf:test-op (op component)
                         (declare (ignore op component))
                         (let ((result (uiop:symbol-call :parachute :test
                                                         :cl-my-project2-tests)))
                           (unless (eq (uiop:symbol-call :parachute :status result)
                                       :passed)
                             (error "Test suite cl-my-project2-tests failed.")))))
