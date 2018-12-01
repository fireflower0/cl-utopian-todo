(defsystem "cl-utopian-todo"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license ""
  :depends-on ("clack"
               "utopian"

               ;; HTML Template
               "djula"

               ;; DB
               "mito"
               "sxql"

               "cl-utopian-todo/app"))
