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

(define (enumerate-interval init end)
  (if (or (> init end) (= init end)) ()
      (cons init (enumerate-interval (+ init 1) end))
      )
)

(define enum_1 (enumerate-interval 0 4))

(define enum_2 (enumerate-interval 5 9))

enum_1

enum_2
;Value: enumerate-interval

;Value: enum_1

;Value: enum_2

;Value 30: (0 1 2 3)

;Value 31: (5 6 7 8)


(map (lambda (i) (map (lambda (j) (list i j)) enum_2)) enum_1)
;Value 32: (((0 5) (0 6) (0 7) (0 8)) ((1 5) (1 6) (1 7) (1 8)) ((2 5) (2 6) (2 7) (2 8)) ((3 5) (3 6) (3 7) (3 8)))


(define comb_1 (map (lambda (i) (map (lambda (j) (list i j)) enum_2)) enum_1))
;Value: comb_1


(define (append list_a list_b)
  (if (null? list_a) list_b
      (cons (car list_a) (append (cdr list_a) list_b))
      )
)
;Value: append


(car comb_1)
;Value 33: ((0 5) (0 6) (0 7) (0 8))


(cdr comb_1)
;Value 34: (((1 5) (1 6) (1 7) (1 8)) ((2 5) (2 6) (2 7) (2 8)) ((3 5) (3 6) (3 7) (3 8)))


(append (car comb_1) (cadr comb_1))
;Value 35: ((0 5) (0 6) (0 7) (0 8) (1 5) (1 6) (1 7) (1 8))


(define (accumulate op init seq)
  (if (null? seq) init
      (accumulate op (op init (car seq)) (cdr seq))
      )
)
;Value: accumulate


(accumulate + 0 (list 1 2 3))
;Value: 6


(accumulate append () (map (lambda (i) (map (lambda (j) (list i j)) enum_2)) enum_1))
;Value 36: ((0 5) (0 6) (0 7) (0 8) (1 5) (1 6) (1 7) (1 8) (2 5) (2 6) (2 7) (2 8) (3 5) (3 6) (3 7) (3 8))


