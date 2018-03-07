(defun parse-md-header (file)
  (break-list-at ; Strip content after second ---
    (cdr ; Remove first ---
      (split '(#\return #\linefeed) file)) "---"))

(defun lisp-md-header (_file_)
  (map 'list (lambda (pairs)
                     (setf pairs (split '(#\:) pairs))
                     (map 'list (lambda (pair)
                                        (setf pair (string-trim " " pair)))
                                        pairs))
                     (parse-md-header _file_)))
