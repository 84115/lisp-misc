(defun file-contents (path)
  "Sucks up an entire file from PATH into a freshly-allocated string, returning two values: the string and the number of bytes read."
  (with-open-file (s path)
    (let* ((len (file-length s))
           (data (make-string len)))
      (values data (read-sequence data s)))))

; (walk-directory "~/Development/lisp/" "*")
; (walk-directory "~/Development/lisp/" "*.*")
(defun walk-directory (directory pattern)
  ""
  (directory (merge-pathnames pattern directory)))
