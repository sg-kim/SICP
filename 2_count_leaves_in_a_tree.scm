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

(define sample_tree (cons (cons (cons 1 2) (cons 3 ())) (cons (cons 5 6) (cons 7 ()))))
;Value: sample_tree

sample_tree
;Value 11: (((1 . 2) 3) (5 . 6) 7)

(car sample_tree)
;Value 13: ((1 . 2) 3)

(cdr sample_tree)
;Value 14: ((5 . 6) 7)

(define (count-leaves tree)
  (if (pair? tree)
      (+ (count-leaves (car tree)) (count-leaves (cdr tree)))
      1
      )
)
;Value: count-leaves

(count-leaves sample_tree)
;Value: 8

(define (count-leaves tree)
  (if (pair? tree)
      (+ (count-leaves (car tree)) (count-leaves (cdr tree)))
      (if (null? tree) 0 1)
      )
)
;Value: count-leaves

(count-leaves sample_tree)
;Value: 6


