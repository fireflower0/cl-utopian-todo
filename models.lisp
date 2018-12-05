(defpackage :cl-utopian-todo/models
  (:use :cl
        :sxql
        :cl-utopian-todo/config)
  (:import-from :mito)
  (:export :create-table
           :insert-task
           :delete-task
           :select-all))
(in-package :cl-utopian-todo/models)

;;;
;; DB Utility

(defun conn-settings (&optional (db :maindb))
  (cdr (assoc db (config :databases))))

(defun db (&optional (db :maindb))
  (apply #'mito:connect-toplevel (conn-settings db)))

(defmacro with-connection (conn &body body)
  `(let ((mito:*connection* ,conn))
     ,@body))

;;;
;; DB Function

(defun create-table ()
  (with-connection (db)
    (mito:deftable tasks ()
      ((name :col-type :text)))
    (mito:execute-sql (first (mito:table-definition `tasks)))))

(defun insert-task (data)
  (with-connection (db)
    (mito:create-dao 'tasks :name data)))

(defun delete-task (id)
  (with-connection (db)
    (mito:delete-by-values 'tasks :id id)))

(defun select-all ()
  (let (ret)
    (with-connection (db)
      (setf ret (mito:select-dao 'tasks)))
    ret))
