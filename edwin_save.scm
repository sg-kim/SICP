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

(define (combination item list2)
  (if (null? item) ()
      (if (null? list2) ()
	  (cons (cons item (car list2)) (combination item (cdr list2)))
	  )
      )
)
;Value: combination

(define (full-combination list1 list2)
  (if (null? list1) ()
      (cons (combination (car list1) list2) (full-combination (cdr list1) list2))
      )
)
;Value: full-combination

(define sample_comb (full-combination (list 1 2 3) (list 4 5 6)))
;Value: sample_comb

sample_comb
;Value 11: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (con (enumerate-pairs (car pairs)) (enumerate-pairs (cdr pairs))) pairs
	  )
      )
)
;Value: enumerate-pairs

(enumerate-pairs sample_comb)
;Unbound variable: con
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of con.
; (RESTART 2) => Define con to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (cons (enumerate-pairs (car pairs)) (enumerate-pairs (cdr pairs))) pairs
	  )
      )
)
;Value: enumerate-pairs

(enumerate-pairs sample_comb)
;Value 13: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define (append list1 list2)
  (if (null? list1) list2
      (cons (car list1) (append (cdr list1) list2))
      )
)
;Value: append

(append (list 1 2 3) (list 4 5 6))
;Value 14: (1 2 3 4 5 6)

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))
      )
)
;Value: accumulate

(define (map op sequence)
  (if (null? sequence) ()
      (cons (op (car sequence)) (map op (cdr sequence)))
      )
)
;Value: map

(define (enumerate-interval init end)
  (if (or (> init end) (= init end)) ()
      (cons init (enumerate-interval (+ init 1) end))
      )
)
;Value: enumerate-interval

(enumerate-interval 0 9)
;Value: ()

(define (enumerate-interval init end)
  (if (or (> init end) (= init end)) ()
      (cons init (enumerate-interval (+ init 1) end))
      )
)
;Value: enumerate-interval

(enumerate-interval 0 9)
;Value 15: (0 1 2 3 4 5 6 7 8)

(accumulate append () (map (lambda (i) map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))) (enumerate-interval 1 n)))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of n.
; (RESTART 3) => Define n to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(accumulate append () (map (lambda (i) map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))) (enumerate-interval 1 i)))
;Unbound variable: i
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of i.
; (RESTART 4) => Define i to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(lambda (i) (+ i 1)) 1
;Value: 1

((lambda (i) (+ i 1)) 1)
;Value: 2

(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))) (enumerate-interval 1 n))))
;The procedure #[compound-procedure 16 map] has been called with 1 argument; it requires exactly 2 arguments.
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of n.
; (RESTART 6) => Define n to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): 1
;Start debugger? (y or n): 0
;Start debugger? (y or n): 1
;Start debugger? (y or n): 0
;Start debugger? (y or n): 
;Quit!



(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 10)))
;Value 17: ((3 1) (4 1) (4 2) (5 1) (5 2) (5 3) (6 1) (6 2) (6 3) (6 4) (7 1) (7 2) (7 3) (7 4) (7 5) (8 1) (8 2) (8 3) (8 4) (8 5) (8 6) (9 1) (9 2) (9 3) (9 4) (9 5) (9 6) (9 7))

(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5)))
;Value 18: ((3 1) (4 1) (4 2))

(define (enumerate-interval init end)
  (if (> init end) ()
      (cons init (enumerate-interval (+ init 1) end))
      )
)
;Value: enumerate-interval

(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5)))
;Value 19: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(accumulate append ()
	    (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
)
;Value 20: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(define sample-comb
  (accumulate append ()
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
	      )
)
;Value: sample-comb

;Value: sample-comb

sample_comb
;Value 11: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

sample_comb
;Value 11: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define sample_comb ())
;Value: sample_comb

sample_comb
;Value: ()

(define sample-comb
  (accumulate append ()
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
	      )
)
;Value: sample-comb

sample_comb
;Value: ()

  (accumulate append ()
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
	      )
;Value 21: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(define sample_comb   (accumulate append ()
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
	      )

(define sample_comb
  (accumulate append ()
	      (map (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 5))
	      )
)
;Value: sample_comb

sample_comb
;Value 22: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(car sample_comb)
;Value 23: (2 1)

(cdr sample_comb)
;Value 24: ((3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(define (prime? n)
  (cond ((= n 0) 0)
	((= n 1) 0)
	((=
;Value 25: #[arity-dispatched-procedure 25]



(cadr sample_comb)
;Value 26: (3 1)

(car sample_comb)
;Value 23: (2 1)

(accumulate append () (map (lambda (i) (map (lambda (j) (map (lambda (k) (list i j k)) (enumerate-interval 1 (- j 1)))) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 4)))
;Value 27: (() () ((3 2 1)) () ((4 2 1)) ((4 3 1) (4 3 2)))


