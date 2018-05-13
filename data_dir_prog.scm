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

(apply + (2 3))
;The object 2 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(apply + 2 3)
;apply: Improper argument list (2 . 3)
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(apply + (list 2 3))
;Value: 5

(pp put)
;Unbound variable: put
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of put.
; (RESTART 4) => Define put to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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
;Value: apply-generic

(define (add x y) (apply-generic 'add x y))
;Value: add

(define (sub x y) (apply-generic 'sub x y))
;Value: sub

(define (mul x y) (apply-generic 'mul x y))
;Value: mul

(define (div x y) (apply-generic 'div x y))
;Value: div

(define (install-prim-number-package)
  (define (tag x) (attach-tag 'prim-number x))
  (put 'add '(prim-number prim-number) (lambda (x y) (tag (+ x y))))
  (put 'sub '(prim-number prim-number) (lambda (x y) (tag (- x y))))
  (put 'mul '(prim-number prim-number) (lambda (x y) (tag (* x y))))
  (put 'div '(prim-number prim-number) (lambda (x y) (tag (/ x y))))
  (put 'make 'prim-number (lambda (x) (tag x)))
  'done)
;Value: install-prim-number-package

(pp install-prim-number-package)
(named-lambda (install-prim-number-package)
  (define (tag x)
    (attach-tag 'prim-number x))
  (put 'add '(prim-number prim-number) (lambda (x y) (tag (+ x y))))
  (put 'sub '(prim-number prim-number) (lambda (x y) (tag (- x y))))
  (put 'mul '(prim-number prim-number) (lambda (x y) (tag (* x y))))
  (put 'div '(prim-number prim-number) (lambda (x y) (tag (/ x y))))
  (put 'make 'prim-number (lambda (x) (tag x)))
  'done)
;Unspecified return value

(define (make-prim-number n) ((get 'make 'prim-number) n))
;Value: make-prim-number

(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))
      )
    )
)
;Value: install-rational-package

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
  'done)
;Value: install-rational-package

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
  (put 'make 'rational (make-rat n d))
  'done)
;Value: install-rational-package

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
  (put 'make 'rational (lambda (n d) (tag (make-rat n d)))
  'done)
;Unbound variable: put
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a value to use instead of put.
; (RESTART 5) => Define put to a given value.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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
  'done)
;Value: install-rational-package

(define (make-rational a b) ((get 'make 'rational) a b))
;Value: make-rational

(define (attach-tag type-tag contens)
  (cons type-tag contents)
)
;Value: attach-tag

(define (install-rectangular-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z) (sqrt (+ (square (real-part z)) (square (imag-part z)))))
  (define (angle z) (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a) (cons (* r (cos a)) (* r (sin a))))
  (define (add-rect x y) (make-from-real-imag (+ (real-part x) (real-part y)) (+ (imag-part x) (imag-part y))))
  (define (sub-rect x y) (make-from-real-imag (- (real-part x) (real-part y)) (- (imag-part x) (imag-part y))))
  (define (mul-rect x y) (make-from-mag-ang (+ (magnitude x) (magnitude y)) (+ (angle x) (angle y)))
  (define (div-rect x y) (make-from-mag-ang (- (magnitude x) (magnitude y)) (- (angle x) (angle y)))
  (define (tag x) (attach-tag 'rect x))
  (put 'real-part '(rect) real-part)
  (put 'imag-part '(rect) imag-part)
  (put 'magnitude '(rect) magnitude)
  (put 'angle '(rect) angle)
  (put 'make-from-real-imag 'rect (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rect (lambda (x y) (tag (make-from-mag-ang r a))))
  (put 'add-rect '(rect rect) (lambda (x y) (tag (add-rect x y))))
  (put 'sub-rect '(rect rect) (lambda (x y) (tag (sub-rect x y))))
  (put 'mul-rect '(rect rect) (lambda (x y) (tag (mul-rect x y))))
  (put 'div-rect '(rect rect) (lambda (x y) (tag (div-rect x y))))
  'done)
;Value: div-rect

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
  (put 'real-part '(rect) real-part)
  (put 'imag-part '(rect) imag-part)
  (put 'magnitude '(rect) magnitude)
  (put 'angle '(rect) angle)
  (put 'make-from-real-imag 'rect (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rect (lambda (x y) (tag (make-from-mag-ang r a))))
  (put 'add-rect '(rect rect) (lambda (x y) (tag (add-rect x y))))
  (put 'sub-rect '(rect rect) (lambda (x y) (tag (sub-rect x y))))
  (put 'mul-rect '(rect rect) (lambda (x y) (tag (mul-rect x y))))
  (put 'div-rect '(rect rect) (lambda (x y) (tag (div-rect x y))))
  'done)
;Value: install-rectangular-package

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
  'done)
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
  'done)
;Value: install-complex-package

(define (make-complex-from-real-imag x y) (attach-tag 'complex ((get 'complex 'make-from-real-imag) x y)))
;Value: make-complex-from-real-imag

(define (make-complex-from-mag-ang x y) (attach-tag 'complex ((get 'make-from-mag-ang 'complex) x y)))
;Value: make-complex-from-mag-ang

(define (make-complex-from-real-imag x y) (attach-tag 'complex ((get 'make-from-real-imag 'complex) x y)))
;Value: make-complex-from-real-imag

(pp apply-generic)
(named-lambda (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error "No method for these types -- APPLY-GENERIC" (list op type-tags))))))
;Unspecified return value

