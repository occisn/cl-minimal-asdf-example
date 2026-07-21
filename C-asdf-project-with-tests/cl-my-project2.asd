(asdf:defsystem "cl-my-project2"
  :version "0.1.1"
  :author "John Doe <john.doe@example.com>"
  :maintainer "John Doe <john.doe@example.com>"
  :license "MIT"
  :homepage "https://github.com/occisn/cl-minimal-examples"
  :description "Minimal ASDF project, with tests."
  :depends-on ()                       ; the test framework belongs to the
                                       ; test system, not to this one
  ;; Compilation policy for every file of the system, set in one place.
  ;;
  ;; Beware: PROCLAIM is global and permanent.  It is not undone when this
  ;; system has finished compiling, so the setting below stays in force for
  ;; the rest of the session and applies to every other system compiled
  ;; afterwards in the same image.
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3) (safety 3) (speed 0)))
                    (funcall next))
  :components ((:module "src"
                :serial t              ; each file may use the previous ones
                :components ((:file "package")
                             (:file "arithmetic")
                             (:file "main"))))
  :in-order-to ((asdf:test-op (asdf:test-op "cl-my-project2-tests"))))
