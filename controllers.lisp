(defpackage :cl-utopian-todo/controllers
  (:use :cl
        :utopian
        :cl-utopian-todo/views
        :cl-utopian-todo/models)
  (:export :*routes*))
(in-package :cl-utopian-todo/controllers)

;;;
;; Routing Function

(defun index (param)
  (declare (ignore params))
  (djula-render #P"index.html"))

(defun index-add (param)
  (let ((name (cdr (assoc "name" param :test #'string=))))
    (insert-task name)
    (djula-render #P"index.html" `(:tasks ,(select-all)))))

(defun index-del (param)
  (let ((id (cdr (assoc "id" param :test #'string=))))
    (delete-task id)
    (djula-render #P"index.html" `(:tasks ,(select-all)))))

;;;
;; Definition route

(defroutes *routes*
    ((:GET "/" #'index)
     (:POST "/task-add" #'index-add)
     (:POST "/task-del" #'index-del)))
