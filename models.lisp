(defpackage :cl-utopian-todo/models
  (:use :cl)
  (:import-from :datafly)
  (:import-from :sxql)
  (:export :create-todo-table))
(in-package :cl-utopian-todo/models)

(defparameter *db-path* (asdf:system-relative-pathname :cl-utopian-todo #P"db/todo.db"))

(defmacro with-connection (conn &body body)
  `(let ((*connection* ,conn))
     ,@body))

(defun create-todo-table ()
  (with-connection (datafly:connect-toplevel :sqlite3 :database-name *db-path*)
    (datafly:execute
     (sxql:create-table (:tasks :if-not-exists t)
         ((id   :type 'integer :primary-key t :unique t :autoincrement t)
          (name :type 'text))))))
