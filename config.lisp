(defpackage :cl-utopian-todo/config
  (:use :cl)
  (:export :*tmp-dir*
           :*db-path*))
(in-package :cl-utopian-todo/config)

(defparameter *app-root* (asdf:system-source-directory :cl-utopian-todo))
(defparameter *tmp-dir*  (merge-pathnames #P"template/" *app-root*))

;; DB Config
(defparameter *db-path* (asdf:system-relative-pathname :cl-utopian-todo #P"db/todo.db"))
