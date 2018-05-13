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

(list '(a b c))
;Value 11: ((a b c))

(list 'a 'b 'c)
;Value 12: (a b c)

(list a b c)
;Unbound variable: c
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of c.
; (RESTART 2) => Define c to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

list '(a b c)
;Value 13: (a b c)

(pp number?)
(named-lambda (complex:complex? object)
  (or (object-type? 60 object)
      ((named-lambda (real:real? object)
         (or (object-type? 6 object)
             ((named-lambda (rat:rational? object)
                (or (object-type? 58 object)
                    (let ((operand object))
                      (or (object-type? 26 operand)
                          (object-type? 14 operand)))))
              object)))
       object)))
;Unspecified return value

(number 'a)
;Unbound variable: number
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of number.
; (RESTART 3) => Define number to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(number? 'a)
;Value: #f

(number? 1)
;Value: #t

(define (sum? expr)
  (if (equal? (car expr) '+) #t #f)
)
;Value: sum?

(sum? (+ 1 2))
;The object 3, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify an argument to use in its place.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(sum? '(+ 1 2))
;Value: #t

(if (sum? '(+ 1 2)) 1 0)
;Value: 1

(define (product? expr)
  (if (equal? (car expr) '*) #t #f)
)
;Value: product?


(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) '(+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var)))
	((product? func) '(+ (* (car (cdr func)) (deriv (cdr (cdr func)) var))
			 (* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(+ x 1) 'x)
;Value 15: (+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var))

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) ('+ (deriv '(car (cdr func)) var) (deriv '(cdr (cdr func)) var)))
	((product? func) ('+ ('* '(car (cdr func)) (deriv '(cdr (cdr func)) var))
			 ('* '(cdr (cdr func)) (deriv '(car (cdr func)) var)))
			 )
	)
)
;Value: deriv

;Value: deriv

(deriv '(+ x 1) 'x)
;The object + is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a procedure to use in its place.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(deriv '(+ x 1) 'x)
;The object + is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a procedure to use in its place.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...

(pp sum?)
(named-lambda (sum? expr)
  (and (equal? (car expr) '+)
       #t))
;Unspecified return value


(sum? '(+ 1 2))
;Value: #t

(sum? '(* 1 2))
;Value: #f

(car (cdr '(* 1 2)))
;Value: 1

'(car (cdr '(* 1 2)))
;Value 17: (car (cdr (quote (* 1 2))))


(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) ('+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var)))
	((product? func) ('+ ('* (car (cdr func)) (deriv (cdr (cdr func)) var))
			 ('* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(+ x 1) 'x)
;The object + is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a procedure to use in its place.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(deriv '(+ x 1) 'x)
;The object + is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a procedure to use in its place.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var)))
	((product? func) (+ (* (car (cdr func)) (deriv (cdr (cdr func)) var))
			 (* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

;Value: deriv

(pp deriv)
(named-lambda (deriv func var)
  (cond ((number? func) 0)
        ((equal? func var) 1)
        ((sum? func) (+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var)))
        ((product? func)
         (+ (* (car (cdr func)) (deriv (cdr (cdr func)) var)) (* (cdr (cdr func)) (deriv (car (cdr func)) var))))))
;Unspecified return value

(sum? (+ 1 2))
;The object 3, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify an argument to use in its place.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (list '+ (deriv (car (cdr func)) var) (deriv (cdr (cdr func)) var)))
	((product? func) (+ (* (car (cdr func)) (deriv (cdr (cdr func)) var))
			 (* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(+ x 1) x)
;Unbound variable: x
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify a value to use instead of x.
; (RESTART 10) => Define x to a given value.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(deriv '(+ x 1) 'x)
;Value 19: (+ 1 #!unspecific)

(number? (cdr (cdr '(+ x 1))))
;Value: #f

;Value 20: (1)

'(+ x 1)
;Value 21: (+ x 1)

(car (cdr (cdr '(+ x 1))))
;Value: 1

;Value: ()

;Value 22: (1)

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (list '+ (deriv (car (cdr func)) var) (deriv (car (cdr (cdr func))) var)))
	((product? func) (+ (* (car (cdr func)) (deriv (car (cdr (cdr func))) var))
			 (* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(+ x 1) 'x)
;The object x, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify an argument to use in its place.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (list '+ (deriv (car (cdr func)) var) (deriv (car (cdr (cdr func))) var)))
	((product? func) (+ (* (car (cdr func)) (deriv (car (cdr (cdr func))) var))
			 (* (cdr (cdr func)) (deriv (car (cdr func)) var)))
			 )
	)
)
;Value: deriv

(deriv '(+ x 1) 'x)
;Value 23: (+ 1 0)

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
;Value 24: (+ (* x 0) (* 2 1))

(deriv '(+ x 3) 'x)
;Value 25: (+ 1 0)

(deriv '(* x y) 'x)
;The object y, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 12) => Specify an argument to use in its place.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
q; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(deriv '(* x y) 'x)
;The object y, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 13) => Specify an argument to use in its place.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...


(pp symbol?)
(named-lambda (symbol? object)
  (or (object-type? 29 object)
      (object-type? 5 object)))
;Unspecified return value

(symbol? 'x)
;Value: #t

(symbol? x)
;Unbound variable: x
;To continue, call RESTART with an option number:
; (RESTART 15) => Specify a value to use instead of x.
; (RESTART 14) => Define x to a given value.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(symbol? 1)
;Value: #f

(pp var?)
;Unbound variable: var?
;To continue, call RESTART with an option number:
; (RESTART 16) => Specify a value to use instead of var?.
; (RESTART 15) => Define var? to a given value.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (var? x) (symbol? x))
;Value: var?

(define (same-var? v1 v2)
  (and (var? v1) (var? v2) (equal? v1 v2))
)
;Value: same-var?

(same-var? 'x 'x)
;Value: #t

(define (make-sum a1 a2) (list '+ a1 a2))
;Value: make-sum

(define (make-product a1 a2) (list '* a1 a2))
;Value: make-product

(define (sum? x) (and (pair? x) (equal (car x) '+)))
;Value: sum?

(define (product? x) (and (pair? x) (equal (car x) '*)))
;Value: product?

(cadr '(+ x 1))
;Value: x

(caddr '(+ x 1))
;Value: 1

(cdr (cdr '(+ x 1)))
;Value 33: (1)

(car (cdr '(+ x 1)))
;Value: x

(deriv '(* x y) 'x)


;Value: deriv

(deriv '(+ x y) 'x)
;Unbound variable: equal
;To continue, call RESTART with an option number:
; (RESTART 17) => Specify a value to use instead of equal.
; (RESTART 16) => Define equal to a given value.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(deriv '(+ x y) 'x)
;Unbound variable: equal
;To continue, call RESTART with an option number:
; (RESTART 18) => Specify a value to use instead of equal.
; (RESTART 17) => Define equal to a given value.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...

(define (sum? x) (and (pair? x) (equal? (car x) '+)))
;Value: sum?


(define (product? x) (and (pair? x) (equal? (car x) '*)))
;Value: product?

(pp sum?)
(named-lambda (sum? x)
  (and (pair? x)
       (equal? (car x) '+)))
;Unspecified return value

(pp product?)
(named-lambda (product? x)
  (and (pair? x)
       (equal? (car x) '*)))
;Unspecified return value

(deriv '(+ x y) 'x)
;Value 36: (+ 1 #!unspecific)

(define (sum? x) (and (pair? x) (equal (car x) '+)))
;Value: sum?

(define (product? x) (and (pair? x) (equal (car x) '*)))

(define (deriv func var)
  (cond ((number? func) 0)
	((equal? func var) 1)
	((sum? func) (list '+ (deriv (car (cdr func)) var) (deriv (car (cdr (cdr func))) var)))
	((product? func) (list '+ (list '* (car (cdr func)) (deriv (car (cdr (cdr func))) var))
			 (list '* (car (cdr (cdr func))) (deriv (car (cdr func)) var)))
			 )
	)
)

(pp deriv)
(named-lambda (deriv func var)
  (cond ((number? func) 0)
        ((equal? func var) 1)
        ((sum? func) (list '+ (deriv (cadr func) var) (deriv (caddr func) var)))
        ((product? func)
         (list '+
               (list '* (cadr func) (deriv (caddr func) var))
               (list '* (caddr func) (deriv (cadr func) var))))))
;Unspecified return value

(define (deriv func var)
  (cond ((number? func) 0)
        ((equal? func var) 1 0)
        ((sum? func) (list '+ (deriv (cadr func) var) (deriv (caddr func) var)))
        ((product? func)
         (list '+
               (list '* (cadr func) (deriv (caddr func) var))
               (list '* (caddr func) (deriv (cadr func) var))))
	)
)
;Value: deriv

;Value: deriv

(deriv '(+ x y) 'x)
;Value 37: (+ 0 #!unspecific)

(define (deriv func var)
  (cond ((number? func) 0)
        (if (equal? func var) 1 0)
        ((sum? func) (list '+ (deriv (cadr func) var) (deriv (caddr func) var)))
        ((product? func)
         (list '+
               (list '* (cadr func) (deriv (caddr func) var))
               (list '* (caddr func) (deriv (cadr func) var))))
	)
)
;Syntactic keyword may not be used as an expression: #[keyword-value-item 38]
;To continue, call RESTART with an option number:
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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

(deriv '(+ x y) 'x)
;Value 39: (+ 1 0)

(deriv '(* (* x y) (+ x 3)) 'x)
;Value 40: (+ (* (* x y) (+ 1 0)) (* (+ x 3) (+ (* x 0) (* y 1))))



