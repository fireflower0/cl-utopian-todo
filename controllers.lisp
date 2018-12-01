(defpackage :cl-utopian-todo/controllers
  (:use :cl
        :utopian
        :cl-utopian-todo/views
        :cl-utopian-todo/models)
  (:export :*routes*))
(in-package :cl-utopian-todo/controllers)

(defun render-todo-list (param)
  (declare (ignore params))
  (djula-render #P"index.html" `(:tasks ,(get-tasks))))

(defroutes *routes*
    ((:GET "/" #'render-todo-list)
     (:POST "/task-add" #'render-todo-list)))
