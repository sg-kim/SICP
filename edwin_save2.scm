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

(define sample_list (list 1 2 3 4 5))
;Value: sample_list

sample_list
;Value 12: (1 2 3 4 5)

(define (length list)
  (if (null? list) 0
      (+ (cdr list) 1)
      )
)
;Value: length

(length sample_list)
;The object (2 3 4 5), passed as the first argument to integer-add, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify an argument to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (length list)
  (if (null? list) 0
      (+ (lengrh (cdr list)) 1)
      )
)
;Value: length

(length sample_list)
;Unbound variable: lengrh
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of lengrh.
; (RESTART 3) => Define lengrh to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (length list)
  (if (null? list) 0
      (+ (length (cdr list)) 1)
      )
)
;Value: length

(length sample_list)
;Value: 5

(define sample_tree (cons (cons (cons 1 2) (cons 3 ())) (cons (cons 5 6) (cons 7 ()))))
;Value: sample_tree

sample_tree
;Value 13: (((1 . 2) 3) (5 . 6) 7)

(define (count-leaves tree)
  (if (null? tree) 0
      (if (pair? tree) (+ (count-leaves (car tree)) (count-leaves (cdr tree))) 1)
      )
)
;Value: count-leaves

(count-leaves sample_tree)
;Value: 6

(define (combination item list2)
  (if (null? list1) ()
      (if (null? list2) ()
	  (cons item (cons (car list2) (combination item (cdr list2))))
	  )
      )
)
;Value: combination

(combination 1 (list 4 5 6))
;Unbound variable: list1
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of list1.
; (RESTART 4) => Define list1 to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (combination item list2)
  (if (null? item) ()
      (if (null? list2) ()
	  (cons item (cons (car list2) (combination item (cdr list2))))
	  )
      )
)
;Value: combination

(combination 1 (list 4 5 6))
;Value 14: (1 4 1 5 1 6)

(define (combination item list2)
  (if (null? item) ()
      (if (null? list2) ()
	  (cons (cons item (car list2)) (combination item (cdr list2)))
	  )
      )
)

(cons (cons 1 2) (cons (cons 2 3)))
;The procedure #[compiled-procedure 15 ("list" #x3) #xc #x2085b84] has been called with 1 argument; it requires exactly 2 arguments.
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n):  
;Starting debugger...



(cons (cons 1 2) (cons (cons 2 3) ()))
;Value 17: ((1 . 2) (2 . 3))

(define (combination item list2)
  (if (null? item) ()
      (if (null? list2) ()
	  (cons (cons item (car list2)) (combination item (cdr list2)))
	  )
      )
)
;Value: combination

(combination 1 (list 4 5 6))
;Value 18: ((1 . 4) (1 . 5) (1 . 6))

(define (full-combination list1 list2)
  (if (null? list1) ()
      (cons (combination (car list1) list2) (full-combination (cdr list1) list2))
      )
)
;Value: full-combination

(full-combination (list 1 2 3) (list 4 5 6))
;Value 19: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define sample_comb (full-combination (list 1 2 3) (list 4 5 6)))
;Value: sample_comb

sample_comb
;Value 20: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(car sample_comb)
;Value 21: ((1 . 4) (1 . 5) (1 . 6))

(car (car sample_comb))
;Value 22: (1 . 4)

(cdr sample_comb)
;Value 23: (((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(cdr (car sample_comb))
;Value 24: ((1 . 5) (1 . 6))

(car (cdr (car sample_comb)))
;Value 25: (1 . 5)

(define (full-combination list1 list2)
  (if (null? list1) ()
      (list (combination (car list1) list2) (full-combination (cdr list1) list2))
      )
)
;Value: full-combination

(full-combination (list 1 2 3) (list 4 5 6))
;Value 26: (((1 . 4) (1 . 5) (1 . 6)) (((2 . 4) (2 . 5) (2 . 6)) (((3 . 4) (3 . 5) (3 . 6)) ())))

(define (full-combination list1 list2)
  (if (null? list1) ()
      (cons (combination (car list1) list2) (full-combination (cdr list1) list2))
      )
)
;Value: full-combination

(full-combination (list 1 2 3) (list 4 5 6))
;Value 27: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (list (car pairs) (enumerate-pairs (cdr pairs))) pairs)
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Value 28: (((1 . 4) (1 . 5) (1 . 6)) (((2 . 4) (2 . 5) (2 . 6)) (((3 . 4) (3 . 5) (3 . 6)) ())))

(pair? (full-combination (list 1 2 3) (list 4 5 6)))
;Value: #t

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (cons (car pairs) (enumerate-pairs (cdr pairs))) pairs)
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Value 29: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (cons (car pairs) (enumerate-pairs (cdr pairs))) pairs)
      )
)

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (if (pair? pairs) (cons (enumerate-pairs (car pairs)) (enumerate-pairs (cdr pairs))) pairs)
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Value 30: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (cons (enumerate-pairs (car pairs)) (enumerate-pairs (cdr pairs)))
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;The object 6, passed as the first argument to cdr, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify an argument to use in its place.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (cons (car (car pairs)) (enumerate-pairs (cdr pairs)))
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Value 31: ((1 . 4) (2 . 4) (3 . 4))

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (cons (car (car pairs)) (enumerate-pairs (cdr (car pairs))))
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;The object 5, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify an argument to use in its place.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (enumerate-pair pairs)
  (if (null? pairs) ()
      (cons (car pairs) (enumerate-pair (cdr pairs)))
      )
)
;Value: enumerate-pair

(define (enumerate-pair pair)
  (if (null? pair) ()
      (cons (car pair) (enumerate-pair (cdr pair)))
      )
)
;Value: enumerate-pair

(define (numerate-pairs pairs)
  (if (null? pairs?) ()
      (cons (enumerate-pair (car pairs)) (enumerate-pair (cdr pairs)))
      )
)
;Value: numerate-pairs

(define (enumerate-pairs pairs)
  (if (null? pairs?) ()
      (cons (enumerate-pair (car pairs)) (enumerate-pair (cdr pairs)))
      )
)

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (cons (enumerate-pair (car pairs)) (enumerate-pair (cdr pairs)))
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Unbound variable: pairs?
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify a value to use instead of pairs?.
; (RESTART 8) => Define pairs? to a given value.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (enumerate-pairs pairs)
  (if (null? pairs) ()
      (cons (enumerate-pair (car pairs)) (enumerate-pair (cdr pairs)))
      )
)
;Value: enumerate-pairs

(enumerate-pairs (full-combination (list 1 2 3) (list 4 5 6)))
;Value 32: (((1 . 4) (1 . 5) (1 . 6)) ((2 . 4) (2 . 5) (2 . 6)) ((3 . 4) (3 . 5) (3 . 6)))

