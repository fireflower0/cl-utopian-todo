(defpackage :cl-utopian-todo/config
  (:use :cl)
  (:import-from :envy
                :config-env-var
                :defconfig)
  (:export :config
           :*tmp-dir*))
(in-package :cl-utopian-todo/config)

(setf (config-env-var) "APP_ENV")

;;;
;; File & Directory Path

(defparameter *app-root* (asdf:system-source-directory :cl-utopian-todo))
(defparameter *tmp-dir*  (merge-pathnames #P"template/" *app-root*))

;;;
;; DB Config

(defconfig :common
    `(:databases ((:maindb :sqlite3 :database-name ,(merge-pathnames #P"db/todo.db" *app-root*)))))

;;;
;; Config Function

(defun config (&optional key)
  (envy:config #.(package-name *package*) key))
