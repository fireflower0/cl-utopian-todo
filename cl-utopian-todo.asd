(defsystem "cl-utopian-todo"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license ""
  :depends-on (;; Web Framework
               "clack"
               "utopian"

               ;; Config
               "envy"

               ;; HTML Template
               "djula"

               ;; DB
               "mito"
               "sxql"

               "cl-utopian-todo/app"))
