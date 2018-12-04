(defpackage :cl-utopian-todo/views
  (:use :cl
        :cl-utopian-todo/config)
  (:import-from :djula
                :add-template-directory
                :compile-template*
                :render-template*)
  (:export :djula-render))
(in-package :cl-utopian-todo/views)

(djula:add-template-directory *tmp-dir*)

(defparameter *template-reg* (make-hash-table :test 'equal))

;;;
;; Rendering

(defun djula-render (template-path &optional env)
  (let ((template (gethash template-path *template-reg*)))
    (unless template
      (setf template (djula:compile-template* (princ-to-string template-path)))
      (setf (gethash template-path *template-reg*) template))
    (apply #'djula:render-template*
           template nil
           env)))
