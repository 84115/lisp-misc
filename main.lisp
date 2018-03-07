;;;; (load "~/Development/lisp/main.lisp")

(defvar env "~/Development/lisp/")

(defun load-local(path)
  ""
  (load(concatenate 'string env path ".lisp")))

(defun reload()
  ""
  (load-local "main"))

(load-local "util/io")
; (load-local "util/math")
(load-local "util/string")
(load-local "dev/markdown")

(defvar file
  (file-contents "~/Development/lisp/data/page.md"))

; (parse-md-header file)

; (split '(#\:) "key: value")
; (string-trim " " "  key: value  ")

(map 'list (lambda (s)
             (split '(#\:) s)) (parse-md-header file))

