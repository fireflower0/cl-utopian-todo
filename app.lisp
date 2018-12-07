(defpackage :cl-utopian-todo/app
  (:use :cl
        :utopian
        :cl-utopian-todo/controllers)
  (:import-from :cl-utopian-todo/config
                :*static-dir*))
(in-package :cl-utopian-todo/app)

(defapp cl-utopian-todo-app () ())

(defvar *app* (make-instance 'cl-utopian-todo-app :routes *routes*))

(builder
 (:static
  :path "/static/"
  :root *static-dir*)
 *app*)
