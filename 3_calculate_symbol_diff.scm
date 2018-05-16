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

(define (sum? expr)
  (if (equal? (car expr) '+) #t #f)
)

(define (product? expr)
  (if (equal? (car expr) '*) #t #f)
)
;Value: sum?

;Value: product?


(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (list '+ (deriv (car (cdr func)) var) (deriv (car (cdr (cdr func))) var)))
	((product? func) (list '+ (list '* (car (cdr func)) (deriv (car (cdr (cdr func))) var))
			 (list '* (car (cdr (cdr func))) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(* x 2) 'x)
;Value 12: (+ (* x 0) (* 2 1))

(deriv '(+ x 3) 'x)
;Value 13: (+ 1 0)

(define (deriv func var)
  (cond ((number? func) 0)
        ((symbol? func) (if (equal? func var) 1 0))
        ((sum? func) (list '+ (deriv (cadr func) var) (deriv (caddr func) var)))
        ((product? func)
         (list '+
               (list '* (cadr func) (deriv (caddr func) var))
               (list '* (caddr func) (deriv (cadr func) var))))
	)
)
;Value: deriv

(deriv '(* x 2) 'x)
;Value 14: (+ (* x 0) (* 2 1))

