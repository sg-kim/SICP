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

(define (iter-factorial n k)
  (let (
	(l 1)
	)
    (if (= k n) l
	(begin
	  (set! l (* k (+ k 1)))
	  (set! k (+ k 1))
	  (iter-factorial n k)
	  )
	)
    )
)
;Value: iter-factorial

(iter-factorial 5 1)
;Value: 1

(define (factorial n)
  (let (
	(k 1)
	(l 1)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* k (+ k 1)))
	  )
      )
    )
)
;Value: factorial

(factorial 5)
;Unspecified return value

(define (factorial n)
  (let (
	(k 1)
	(l 1)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* k (+ k 1)))
	  )
      )
    )
  (iter-factorial n k l)
)
;Value: factorial

(factorial 5)
;Unbound variable: l
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of l.
; (RESTART 2) => Define l to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (factorial n)
  (let (
	(k 1)
	(l 1)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* k (+ k 1)))
	  )
      )
    (iter-factorial n k l)
    )
)
;Value: factorial

(factorial 5)
;Value: 20

(* 5 4 3 2 1)
;Value: 120

(define (factorial n)
  (let (
	(k 1)
	(l 0)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* l (+ k 1)))
	  )
      )
    (iter-factorial n k l)
    )
)
;Value: factorial

(factorial 5)
;Value: 40

(define (factorial n)
  (let (
	(k 1)
	(l 1)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* l (+ k 1)))
	  )
      )
    (iter-factorial n k l)
    )
)
;Value: factorial

(factorial 5)
;Value: 0

(define (factorial n)
  (let (
	(k 1)
	(l 1)
	)
    (define (iter-factorial n k l)
      (if (= k n) l
	  (iter-factorial n (+ k 1) (* l (+ k 1)))
	  )
      )
    (iter-factorial n k l)
    )
)
;Value: factorial

(factorial 5)
;Value: 120

(read n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of n.
; (RESTART 3) => Define n to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (rd-show n)
  (read n)
  (displany n)
)
;Value: rd-show

(rd-show 8)
;The object 8, passed as an argument to read, is not an input port.
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(pp read)
(named-lambda (read #!optional port environment)
  (parse-object (optional-input-port port 'read) environment))
;Unspecified return value

