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



; https://stackoverflow.com/questions/8830888/whats-the-canonical-way-to-join-strings-in-a-list
(defmacro sql (&rest phrases)
  `(let ((acc '()))
    (dolist (phrase ',phrases)
      (setf phrase (cond
                     ((stringp phrase) phrase)
                     ((listp phrase) (format nil "~{~A~^, ~}" phrase))
                     ((numberp phrase) (string phrase))
                     ((symbolp phrase) (string phrase))
                     (t (string phrase))))
      (setf acc (nconc acc (list phrase))))
    (setf acc (nconc acc (list ";")))
    (format t "{{~a}}~%" acc) acc))



(sql SELECT ("id" "name" "age")
     FROM "users"
     WHERE "name"
     LIKE "%james%"
     ORDER BY "age" DESC)

(sql SELECT *
     FROM "contacts"
     WHERE "last_name" <> "Johnson")

(sql INSERT INTO "Customers"
       ("CustomerName" "ContactName" "Address" "City" "PostalCode" "Country")
     VALUES
       ("Cardinal" "Tom B. Erichsen" "Skagen 21" "Stavanger" 4006 "Norway"))






