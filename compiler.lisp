(defun run-compiler ()
  (sb-ext:save-lisp-and-die
   "bin/run"
   :toplevel #'(lambda ()
                 (main (cdr sb-ext:*posix-argv*)))
   :executable t
   :save-runtime-options t))
