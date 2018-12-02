(defpackage :cl-utopian-todo/config
  (:use :cl)
  (:export :*tmp-dir*))
(in-package :cl-utopian-todo/config)

(defparameter *app-root* (asdf:system-source-directory :cl-utopian-todo))
(defparameter *tmp-dir*  (merge-pathnames #P"template/" *app-root*))
