(defpackage :cl-utopian-todo/app
  (:use :cl
        :utopian
        :cl-utopian-todo/controllers))
(in-package :cl-utopian-todo/app)

(defapp cl-utopian-todo-app () ())

(make-instance 'cl-utopian-todo-app
               :routes *routes*)
