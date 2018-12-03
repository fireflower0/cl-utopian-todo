(defpackage :cl-utopian-todo/controllers
  (:use :cl
        :utopian
        :cl-utopian-todo/views
        :cl-utopian-todo/models)
  (:export :*routes*))
(in-package :cl-utopian-todo/controllers)

(defun index (param)
  (declare (ignore params))
  (djula-render #P"index.html"))

(defun render-todo-add (param)
  (let ((name (cdr (assoc "name" param :test #'string=))))
    (insert-todo-table name)
    (djula-render #P"index.html" `(:tasks ,(get-tasks)))))

(defroutes *routes*
    ((:GET "/" #'index)
     (:POST "/task-add" #'render-todo-add)))
