(defpackage :cl-utopian-todo/controllers
  (:use :cl
        :utopian
        :cl-utopian-todo/views
        :cl-utopian-todo/models)
  (:export :*routes*))
(in-package :cl-utopian-todo/controllers)

(defun index (params)
  (declare (ignore params))
  (djula-render #P"index.html"))

(defroutes *routes*
    ((:GET "/" #'index)))
