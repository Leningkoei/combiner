;;;; Combining all files to one single file when compiling.
;;;; Receive a target pathname and file pathnames (ordered).

(defun combine (target &rest pathnames)
  (with-open-file (out target :direction :output :if-exists :supersede)
    (dolist (pathname pathnames)
      (with-open-file (in pathname :direction :input :if-does-not-exist nil)
        (loop with buffer = (make-array 4096 :element-type 'character)
              for length = (read-sequence buffer in)
              while (> length 0)
              do (write-sequence buffer out :end length)))))
  'done)

(defun main (arguments)
  (apply #'combine (car arguments) (cdr arguments)))
