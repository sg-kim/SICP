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

(define (same-variable? a b) (equal? a b))

(define (variable? a) (symbol? a))
;Value: same-variable?

;Value: variable?

(define op_table (make-2d-table (cons () ())))
;Value: op_table

(define (put op data_type lambda) (op_table 'insert-item op data_type lambda))

(define (get op data_type) (op_table 'read-item op data_type))
;Value: put

;Value: get

(define (type-tag data) (car data))

(define (contents data) (cdr data))

(define (attach-tag type_tag contents) (cons type_tag contents))

(define (apply-generic op . args)
  (let (
	(type-tags (map type-tag args))
	)
    (let (
	  (proc (get op type-tags))
	  )
      (if proc (apply proc (map contents args))
	  (error "No method for these types -- APPLY-GENERIC" (list op type-tags))
	  )
      )
    )
)
;Value: type-tag

;Value: contents

;Value: attach-tag

;Value: apply-generic

(op_table 'get-table)
;Value 21: (())

(define (empty-termlist? term-list) (null? term-list))
;Value: empty-termlist?

(define (add-terms l1 l2)
  (cond ((empty-termlist? l1) l2)
	((empty-termlist? l2) l1)
	(else
	 (let (
	       (t1 (first-term l1))
	       (t2 (first-term l2))
	       )
	   (cond ((> (order t1) (order t2)) (adjoin-term t1 (add-term (rest-terms l1) l2)))
		 ((< (order t1) (order t2)) (adjoin-term t2 (add-term l1 (rest-terms l2))))
		 (else (adjoin-term
			(make-term (order t1) (add (coeff t1) (coeff t2)))
			(add-terms (rest-terms l1) (rest-terms l2))
			)
		       )
		 )
	   )
	 )
	)
)
;Value: add-terms

(define (mul-terms l1 l2)
  (if (empty-termlist? l1) ()
      (add-terms (mul-term-by-all-terms (first-term l1) l2)
		 (mul-terms (rest-terms l1) l2)
		 )
      )
)

(define (mul-term-by-all-terms t1 l)
  (if (empty-termlist? l) ()
      (let (
	    (t2 (first-term l))
	    )
	(adjoin-term (+ (order t1) (order t2))
		     (mul (coeff t1) (coeff t2)))
	(mul-term-by-all-terms t1 (rest-terms l))
	)
      )
)
;Value: mul-terms

;Value: mul-term-by-all-terms

(define (adjoin-term term term-list)
  (if (=zero? (coeff term)) term-list
      (cons term term-list)
      )
)
;Value: adjoin-term

(define (the-empty-termlist) ())
(define (first-term term-list) (car term-list))
(define (rest-terms term-list) (cdr term-list))
(define (meke-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term))
;Value: the-empty-termlist

;Value: first-term

;Value: rest-terms

;Value: meke-term

;Value: order

;Value: coeff

(define (add a b) (+ a b))
(define (mul a b) (* a b))
;Value: add

;Value: mul

(define (install-polynomial-package)
  ;; intenal procedures
  (define (make-poly var term-list) (cons var term-list))
  (define (var p) (car p))
  (define (term-list p) (cdr p))
  (define (same-variable? a b) (equal? a b))
  (define (variable? a) (symbol? a))
  ;; representation of terms and term lists
  ;; procedures for polynomial addition and multiplication
  (define (add-poly p1 p2)
    (let ((var1 (var p1)) (var2 (var p2)))
      (if (and (and (variable? var1) (variable? var2)) (same-variable? var1 var2))
	  (make-poly var1 (add-terms (term-list p1) (term-list p2)))
	  (error "Polys are not in the same var -- ADD-POLY" (list p1 p2))
	  )
      )
    )
  (define (mul-poly p1 p2)
    (let ((var1 (var p1)) (var2 (var p2)))
      (if (and (and (variable? var1) (variable? var2)) (same-variable? var1 var2))
	  (make-poly var1 (mul-terms (term-list p1) (term-list p2)))
	  (error "Polys are not in the same var -- MUL-POLY" (list p1 p2))
	  )
      )
    )
  ;; interface for apply-generic method
  (define (tag p) (cons 'polynomial p))
  (put 'add '(polynomial polynomial) (lambda (a b) (tag (add-poly a b))))
  (put 'mul '(polynomial polynomial) (lambda (a b) (tag (mul-poly a b))))
  (put 'make 'polynomial (lambda (var term-list) (tag (make-poly var term-list))))
  'done
)
;Value: install-polynomial-package

(install-polynomial-package)
;Value: done

(op_table 'get-table)
;Value 21: ((add ((polynomial polynomial) . #[compound-procedure 22])) (mul ((polynomial polynomial) . #[compound-procedure 23])) (make (polynomial . #[compound-procedure 24])))

(define (make-poly var terms) ((get 'make 'polynomial) var terms))
;Value: make-poly

