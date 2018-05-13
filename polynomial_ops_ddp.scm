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

(symbol? ())
;Value: #f

(symbol? 2)
;Value: #f

(symbol? 'a)
;Value: #t

(define (same-variable? a b) (equal? a b))
;Value: same-variable?

(define (variable? a) (symbol? a))
;Value: variable?

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

