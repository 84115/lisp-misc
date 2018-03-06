; http://thegeekrising.blogspot.co.uk/2012/05/simple-split-and-join-functions-in.html
(defun split (chars str &optional (lst nil) (accm ""))
  (cond
    ((= (length str) 0) (reverse (cons accm lst)))
    (t
      (let ((c (char str 0)))
       (if (member c chars)
           (split chars (subseq str 1) (cons accm lst) "")
           (split chars (subseq str 1) 
                  lst 
                  (concatenate 'string
                  accm
                  (string c))))))))

; (print
;    (split '(#\space) "my name is james"))

(defun join (str lst &optional (joiner ""))
  (cond
    ((null lst) joiner)
    (t
      (let ((news (concatenate 'string
                                joiner
                                (first lst)
                                (if (null (rest lst))
                                    ""
                                    str))))
         (join str (rest lst) news)))))

(defun range (start stop &optional (step 2))
  (when (<= start stop)
    (cons start (range (+ start step) stop step))))
