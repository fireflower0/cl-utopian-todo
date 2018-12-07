# cl-utopian-todo

It is a simple TODO list Web application.  

![Screenshot](https://github.com/fireflower0/cl-utopian-todo/blob/master/img/Screenshot.png)

## Installation

```
ros install fireflower0/cl-utopian-todo
```

## Usage

```
(ql:quickload :cl-utopian-todo)
(cl-utopian-todo/models:create-table)
(clack:clackup #P"app.lisp")
```

## Author

fireflower0

## Copyright

Copyright (c) 2018 fireflower0
