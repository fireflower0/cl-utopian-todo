(defpackage :cl-utopian-todo/models
  (:use :cl)
  (:import-from :mito)
  (:export :create-todo-table
           :insert-todo-table))
(in-package :cl-utopian-todo/models)

(defparameter *db-path* (asdf:system-relative-pathname :cl-utopian-todo #P"db/todo.db"))

(defmacro with-connection (conn &body body)
  `(let ((mito:*connection* ,conn))
     ,@body
     (dbi:disconnect mito:*connection*)))

(defun create-todo-table ()
  (with-connection (dbi:connect :sqlite3 :database-name *db-path*)
    (mito:deftable tasks ()
      ((name :col-type :text)))
    (mito:execute-sql (first (mito:table-definition `tasks)))
    (mito:ensure-table-exists `tasks)))

(defun insert-todo-table (data)
  (with-connection (dbi:connect :sqlite3 :database-name *db-path*)
    (mito:create-dao 'tasks :name data)))
