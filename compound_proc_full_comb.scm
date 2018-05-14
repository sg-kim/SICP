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
;Value: enumerate-interval

(enumerate-interval 0 9)
;Value 11: (0 1 2 3 4 5 6 7 8)

(define enum_1 (enumerate-interval 0 4))
;Value: enum_1

enum_1
;Value 12: (0 1 2 3)

(define enum_2 (enumerate-interval 5 9))
;Value: enum_2

enum_2
;Value 13: (5 6 7 8)

(map (lambda (i) (map (lambda (j) (list i j)) enum_2)) enum_1)
