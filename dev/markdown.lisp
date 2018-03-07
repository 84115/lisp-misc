;;;; Markdown Utilities
;;;; 

;;; PARSE-MD-HEADER
;;; 
(defun parse-md-header (file)
  ;; Remove any data after
  ;; the string ---
  (break-list-at
    ;; Remove the first Header Divider
    (cdr
      (split '(#\return #\linefeed) file)) "---"))


;;; LISP-MD-HEADER
;;; Sorts the Markdown Header
;;; into a lisp readable lisp
(defun lisp-md-header (_file_)
  ;; Itterate over each
  ;; Markdown Header Pair
  (map 'list (lambda (pairs)
                     ;; Split a pair into two pieces by :
                     (setf pairs (split '(#\:) pairs))
                     (map 'list (lambda (pair)
                                        ;; Remove whitespace
                                        ;; the key value pairs
                                        (setf pair (string-trim " " pair)))
                                        pairs))
                     (parse-md-header _file_)))
