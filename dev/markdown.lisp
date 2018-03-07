(defun parse-md-header (file)
  (break-list-at ; Strip content after second ---
    (cdr ; Remove first ---
      (split '(#\return #\linefeed) file)) "---"))
