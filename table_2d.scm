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

(null? ())
;Value: #t


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
    (if (null? table) () (get-row (get-col table col) row))
    )
  (define (insert-item table col row item)
    (if (empty? table)
	(set-car! table (cons col (cons (cons row item) ())))
	(if (null? (get-col table col))
	    (set-cdr! (get-last-col table) (cons col (cons (cons row item) ())))
	    (set-cdr! (get-last-row (get-col table col)) (cons (cons row item) ()))
	    )
	)
    )
  (define (get-table) table)
  (define (dispatch op . args)
    (cond ((equal? op 'read-item) (read-item (car args) (cadr args) (caddr args)))
	  ((equal? op 'insert-item) (insert-item (car args) (cadr args) (caddr args) (cadddr args)))
	  (else (error "undefined operation - " op))
	  )
    )
  dispatch
)
;Value: make-2d-table

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
    (if (null? table) () (get-row (get-col table col) row))
    )
  (define (insert-item table col row item)
    (if (empty? table)
	(set-car! table (cons col (cons (cons row item) ())))
	(if (null? (get-col table col))
	    (set-cdr! (get-last-col table) (cons col (cons (cons row item) ())))
	    (set-cdr! (get-last-row (get-col table col)) (cons (cons row item) ()))
	    )
	)
    table
    )
  (define (get-table) table)
  (define (dispatch op . args)
    (cond ((equal? op 'read-item) (read-item (car args) (cadr args) (caddr args)))
	  ((equal? op 'insert-item) (insert-item (car args) (cadr args) (caddr args) (cadddr args)))
	  ((equal? op 'get-table) (get-table table))
	  (else (error "undefined operation - " op))
	  )
    )
  dispatch
)
;Value: make-2d-table

(define t2 (make-2d-table (cons () ())))
;Value: t2

(pp t2)
(named-lambda (dispatch op . args)
  (cond ((equal? op 'read-item) (read-item (car args) (cadr args) (caddr args)))
        ((equal? op 'insert-item) (insert-item (car args) (cadr args) (caddr args) (cadddr args)))
        ((equal? op 'get-table) (get-table table))
        (else (error "undefined operation - " op))))
;Unspecified return value

(t2 'get-table)
;The procedure #[compound-procedure 12 get-table] has been called with 1 argument; it requires exactly 0 arguments.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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
    (if (null? table) () (get-row (get-col table col) row))
    )
  (define (insert-item table col row item)
    (if (empty? table)
	(set-car! table (cons col (cons (cons row item) ())))
	(if (null? (get-col table col))
	    (set-cdr! (get-last-col table) (cons col (cons (cons row item) ())))
	    (set-cdr! (get-last-row (get-col table col)) (cons (cons row item) ()))
	    )
	)
    table
    )
  (define (get-table) table)
  (define (dispatch op . args)
    (cond ((equal? op 'read-item) (read-item (car args) (cadr args) (caddr args)))
	  ((equal? op 'insert-item) (insert-item (car args) (cadr args) (caddr args) (cadddr args)))
	  ((equal? op 'get-table) (get-table))
	  (else (error "undefined operation - " op))
	  )
    )
  dispatch
)
;Value: make-2d-table

(define t2 (make-2d-table (cons () ())))
;Value: t2

(pp t2)
(named-lambda (dispatch op . args)
  (cond ((equal? op 'read-item) (read-item (car args) (cadr args) (caddr args)))
        ((equal? op 'insert-item) (insert-item (car args) (cadr args) (caddr args) (cadddr args)))
        ((equal? op 'get-table) (get-table))
        (else (error "undefined operation - " op))))
;Unspecified return value

(t2 'get-table)
;Value 13: (())

(t2 'insert-item 

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
    (if (null? table) () (get-row (get-col table col) row))
    )
  (define (insert-item table col row item)
    (if (empty? table)
	(set-car! table (cons col (cons (cons row item) ())))
	(if (null? (get-col table col))
	    (set-cdr! (get-last-col table) (cons col (cons (cons row item) ())))
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

(define t2 (make-2d-table (cons () ())))
;Value: t2

(t2 'insert-item 'a 1 'a1)
;Value 14: ((a (1 . a1)))

(t2 'insert-item 'a 2 'a2)
;Value 14: ((a (1 . a1) (2 . a2)))

(t2 'insert-item 'b 1 'b1)
;Value 14: ((a (1 . a1) (2 . a2)) b (1 . b1))

(t2 'insert-item 'b 2 'b2)
;The object b, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify an argument to use in its place.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(t2 'get-table)
;Value 14: ((a (1 . a1) (2 . a2)) b (1 . b1))

(t2 'insert-item 'b 2 'b2)
;The object b, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify an argument to use in its place.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...

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
    (if (null? table) () (get-row (get-col table col) row))
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

(define t2 (make-2d-table (cons () ())))
;Value: t2


(t2 'insert-item 'a 1 'a1)
;Value 27: ((a (1 . a1)))


(t2 'insert-item 'a 2 'a2)
;Value 27: ((a (1 . a1) (2 . a2)))


(t2 'insert-item 'b 1 'b1)
;Value 27: ((a (1 . a1) (2 . a2)) (b (1 . b1)))


;Value 14: ((a (1 . a1) (2 . a2)) b (1 . b1))

(t2 'insert-item 'b 2 'b2)
;Value 27: ((a (1 . a1) (2 . a2)) (b (1 . b1) (2 . b2)))

(t2 'read-item 'b 1)
;Value 28: (1 . b1)

(t2 'read-item 'b 2)
;Value 29: (2 . b2)

(t2 'insert-item 'c 1 'c1)
;Value 27: ((a (1 . a1) (2 . a2)) (b (1 . b1) (2 . b2)) (c (1 . c1)))

(t2 'read-item 'c 1)
;Value 30: (1 . c1)

