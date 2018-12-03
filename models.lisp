(defpackage :cl-utopian-todo/models
  (:use :cl
        :sxql
        :cl-utopian-todo/config)
  (:import-from :mito)
  (:export :create-todo-table
           :insert-todo-table
           :get-tasks))
(in-package :cl-utopian-todo/models)

(defmacro with-connection (conn &body body)
  `(let ((mito:*connection* ,conn))
     ,@body
     (dbi:disconnect mito:*connection*)))

(defun create-todo-table ()
  (with-connection (dbi:connect :sqlite3 :database-name *db-path*)
    (mito:deftable tasks ()
      ((name :col-type :text)))
    (mito:execute-sql (first (mito:table-definition `tasks)))))

(defun insert-todo-table (data)
  (with-connection (dbi:connect :sqlite3 :database-name *db-path*)
    (mito:create-dao 'tasks :name data)))

(defun get-tasks ()
  (let (ret)
    (with-connection (dbi:connect :sqlite3 :database-name *db-path*)
      (setf ret (mito:select-dao 'tasks)))
    ret))
