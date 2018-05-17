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


(define (install-prim-number-package)
  (define (tag x) (attach-tag 'prim-number x))
  (put 'add '(prim-number prim-number) (lambda (x y) (tag (+ x y))))
  (put 'sub '(prim-number prim-number) (lambda (x y) (tag (- x y))))
  (put 'mul '(prim-number prim-number) (lambda (x y) (tag (* x y))))
  (put 'div '(prim-number prim-number) (lambda (x y) (tag (/ x y))))
  (put 'make 'prim-number (lambda (x) (tag x)))
  'done
)
;Value: install-prim-number-package

(define op_table (make-2d-table (cons () ())))
;Value: op_table


(define (put op type_tags lambda) (op_table 'insert-item op type_tags lambda))
;Value: put

(install-prim-number-package)
;Value: done

(op_table 'get-table)
;Value 11: ((add ((prim-number prim-number) . #[compound-procedure 12])) (sub ((prim-number prim-number) . #[compound-procedure 13])) (mul ((prim-number prim-number) . #[compound-procedure 14])) (div ((prim-number prim-number) . #[compound-procedure 15])) (make (prim-number . #[compound-procedure 16])))

(define (get op type_tags) (op_table 'read-item op type_tags))
;Value: get

(define (make-prim-num n) ((get 'make 'prim-number) n))
;Value: make-prim-num

(define prim_1 (make-prim-num 1))
;Value: prim_1

prim_1
;Value 17: (prim-number . 1)

(car prim_1)
;Value: prim-number

(symbol? (car prim_1))
;Value: #t

(define prim_2 (make-prim-num 2))
;Value: prim_2

(define prim_3 (apply-generic 'add prim_1 prim_2))
;Value: prim_3

prim_3
;Value 18: (prim-number . 3)

(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (- (* (numer x) (denum y)) (* (numer y) (denom x))) (* (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (* (numer x) (numer y)) (* (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (* (numer x) (denom y)) (* (denom x) (numer y))))
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational) (lambda (x y) (add-rat x y)))
  (put 'sub '(rational rational) (lambda (x y) (sub-rat x y)))
  (put 'mul '(rational rational) (lambda (x y) (mul-rat x y)))
  (put 'div '(rational rational) (lambda (x y) (div-rat x y)))
  (put 'make 'rational (lambda (x y) (tag (make-rat x y))))
  'done
)
;Value: install-rational-package

(op_table 'get-table)
;Value 11: ((add ((prim-number prim-number) . #[compound-procedure 12])) (sub ((prim-number prim-number) . #[compound-procedure 13])) (mul ((prim-number prim-number) . #[compound-procedure 14])) (div ((prim-number prim-number) . #[compound-procedure 15])) (make (prim-number . #[compound-procedure 16])))

(install-rational-package)
;Value: done

(op_table 'get-table)
;Value 11: ((add ((prim-number prim-number) . #[compound-procedure 12]) ((rational rational) . #[compound-procedure 19])) (sub ((prim-number prim-number) . #[compound-procedure 13]) ((rational rational) . #[compound-procedure 20])) (mul ((prim-number prim-number) . #[compound-procedure 14]) ((rational rational) . #[compound-procedure 21])) (div ((prim-number prim-number) . #[compound-procedure 15]) ((rational rational) . #[compound-procedure 22])) (make (prim-number . #[compound-procedure 16]) (rational . #[compound-procedure 23])))

(define (make-rational-num n d) ((get 'make 'rational) n d))
;Value: make-rational-num

(define ratio_1_5 (make-rational-num 1 5))
;Value: ratio_1_5

ratio_1_5
;Value 25: (rational 1 . 5)

(define ratio_2_5 (make-rational-num 2 5))
;Value: ratio_2_5

ratio_2_5
;Value 26: (rational 2 . 5)

(define ratio_3_5 (apply-generic 'add ratio_1_5 ratio_2_5))
;Value: ratio_3_5

ratio_3_5
;Value 27: (3 . 5)

(define (install-rectangular-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z) (sqrt (+ (square (real-part z)) (square (imag-part z)))))
  (define (angle z) (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a) (cons (* r (cos a)) (* r (sin a))))
  (define (add-rect x y) (make-from-real-imag (+ (real-part x) (real-part y)) (+ (imag-part x) (imag-part y))))
  (define (sub-rect x y) (make-from-real-imag (- (real-part x) (real-part y)) (- (imag-part x) (imag-part y))))
  (define (mul-rect x y) (make-from-mag-ang (+ (magnitude x) (magnitude y)) (+ (angle x) (angle y))))
  (define (div-rect x y) (make-from-mag-ang (- (magnitude x) (magnitude y)) (- (angle x) (angle y))))
  (define (tag x) (attach-tag 'rect x))
  (put 'make-from-real-imag 'rect (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rect (lambda (x y) (tag (make-from-mag-ang r a))))
  (put 'add-rect '(rect rect) (lambda (x y) (tag (add-rect x y))))
  (put 'sub-rect '(rect rect) (lambda (x y) (tag (sub-rect x y))))
  (put 'mul-rect '(rect rect) (lambda (x y) (tag (mul-rect x y))))
  (put 'div-rect '(rect rect) (lambda (x y) (tag (div-rect x y))))
  'done
)
;Value: install-rectangular-package

(define (install-complex-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z) (sqrt (+ (square (real-part z)) (square (imag-part z)))))
  (define (angle z) (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a) (cons (* r (cos a)) (* r (sin a))))
  (define (add-rect x y) (make-from-real-imag (+ (real-part x) (real-part y)) (+ (imag-part x) (imag-part y))))
  (define (sub-rect x y) (make-from-real-imag (- (real-part x) (real-part y)) (- (imag-part x) (imag-part y))))
  (define (mul-rect x y) (make-from-mag-ang (+ (magnitude x) (magnitude y)) (+ (angle x) (angle y))))
  (define (div-rect x y) (make-from-mag-ang (- (magnitude x) (magnitude y)) (- (angle x) (angle y))))
  (define (tag x) (attach-tag 'complex x))
  (put 'make-from-real-imag 'complex (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex (lambda (x y) (tag (make-from-mag-ang r a))))
  (put 'add-rect '(complex complex) (lambda (x y) (tag (add-rect x y))))
  (put 'sub-rect '(complex complex) (lambda (x y) (tag (sub-rect x y))))
  (put 'mul-rect '(complex complex) (lambda (x y) (tag (mul-rect x y))))
  (put 'div-rect '(complex complex) (lambda (x y) (tag (div-rect x y))))
  'done
)
;Value: install-complex-package

(define (make-complex-from-real-imag x y) (attach-tag 'complex ((get 'complex 'make-from-real-imag) x y)))

(define (make-complex-from-mag-ang x y) (attach-tag 'complex ((get 'make-from-mag-ang 'complex) x y)))

(define (make-complex-from-real-imag x y) (attach-tag 'complex ((get 'make-from-real-imag 'complex) x y)))
;Value: make-complex-from-real-imag

;Value: make-complex-from-mag-ang

;Value: make-complex-from-real-imag

