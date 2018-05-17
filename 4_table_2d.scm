Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not
even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Monday May 19, 2014 at 9:55:33 PM
  Release 9.2 || Microcode 15.1 || Runtime 15.7 || Win32 1.8 || SF 4.41 || LIAR/i386 4.118
  Edwin 3.116
;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)


(define (make-2d-table table)
  (define (empty? table)
    (and (equal? (car table) ()) (equal? (cdr table) ()))
    )
  (define (get-col table col)
    (if (null? table) ()
	(if (equal? (car (car table)) col) (cdr (car table)) (get-col (cdr table) col))
	)
    )
  (define (get-last-col table)
    (if (empty? table) table
	(if (null? (cdr table)) table (get-last-col (cdr table)))
	)
    )
  (define (get-row col-table row)
    (if (null? col-table) ()
	(if (equal? (car (car col-table)) row) (car col-table)
	    (get-row (cdr col-table) row)
	    )
	)
    )
  (define (get-last-row col-table)
    (if (null? col-table) ()
	(if (null? (cdr col-table)) col-table
	    (get-last-row (cdr col-table))
	    )
	)
    )
  (define (read-item table col row)
    (if (null? table) () (cdr (get-row (get-col table col) row)))
    )
  (define (insert-item table col row item)
    (if (empty? table)
	(set-car! table (cons col (cons (cons row item) ())))
	(if (null? (get-col table col))
	    (set-cdr! (get-last-col table) (cons (cons col (cons (cons row item) ())) ()))
	    (set-cdr! (get-last-row (get-col table col)) (cons (cons row item) ()))
	    )
	)
    table
    )
  (define (get-table) table)
  (define (dispatch op . args)
    (cond ((equal? op 'read-item) (read-item table (car args) (cadr args)))
	  ((equal? op 'insert-item) (insert-item table (car args) (cadr args) (caddr args)))
	  ((equal? op 'get-table) (get-table))
	  (else (error "undefined operation - " op))
	  )
    )
  dispatch
)
;Value: make-2d-table

(define test_table (make-2d-table (cons () ())))
;Value: test_table

(test_table 'insert-item 0 0 00)
;Value 34: ((0 (0 . 0)))

(test_table 'insert-item 0 1 01)
;Value 34: ((0 (0 . 0) (1 . 1)))

(test_table 'insert-item 1 0 10)
;Value 34: ((0 (0 . 0) (1 . 1)) (1 (0 . 10)))

(test_table 'insert-item 1 1 11)
;Value 34: ((0 (0 . 0) (1 . 1)) (1 (0 . 10) (1 . 11)))

(test_table 'read-item 0 0)
;Value: 0

(test_table 'read-item 1 0)
;Value: 10

(test_table 'read-item 1 1)
;Value: 11

