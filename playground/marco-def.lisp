(defmacro deftest (name &rest body)
  `(if ,(name) (progn ,@body)))

; (deftest "My first test"
;          ((:dialect "marco")
;           (:fakify t)
;           (:database t))
;          ""
;          (expect-eql 1 1)
;          (expect-eql (square 10)
;                      (* 10)))



;;;;



(defmacro defroute ((&key
                      (method 'GET)
                      (path "/"))
                    &rest body)
  "docstring"
  (print method)
  (print path)
  `(progn ,@body))

; (defroute (:path ("/" "/home" "/index"))
;           nil)

; (defroute (:path "/contact/submit" :method (HEADER POST))
;           nil)



;;;;



(defmacro say (phrase)
  `(print ',phrase))



;;;;



(defmacro sql (&rest phrases)
  `(let ((acc '()))
    (dolist (phrase ',phrases)
      (setf acc (nconc acc (list phrase))))
    (format t "query = ~a ~%" acc) acc))

; (sql
;   SELECT ("name" "age")
;   FROM "users"
;   WHERE "name" LIKE "James")