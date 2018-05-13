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

(define (make-leaf symbol weight)
  (list 'leaf symbol weight)
)
;Value: make-leaf

(define (leaf? node)
  (if (equal? (car node) 'leaf) true false)
)
;Value: leaf?

(define (symbol-leaf node) (cadr node))
;Value: symbol-leaf

(define (weight-leaf node) (caddr node))
;Value: weight-leaf

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left) (symbols right))
	(+ (weights left) (weights right))
	)
)
;Value: make-code-tree

(define (symbols node)
  (if (leaf? node) (symbol-leaf node) (caddr node))
)
;Value: symbols

(define (weights node)
  (if (leaf? node) (weight-leaf node) (cadddr node))
)
;Value: weights

(define (adjoin-set x set)
  (if (null? set) (list x)
      (if (< (weight x) (weight (car set))) (cons x set)
	  (adjoin-set x (cdr set))
	  )
      )
)
;Value: adjoin-set

(define (make-leaf-set pairs)
  (if (null? pairs) '()
      (let ((pair (car pairs)))
	(adjoin-set (make-leaf (car pair) (cadr pair)) (make-leaf-set (cdr pairs)))
	)
      )
)
;Value: make-leaf-set

(define (append list1 list2)
  (if (null? list1) (if (pair? list2) list2 (list list2))
      (if (pair? list1) (cons (car list1) (append (cdr list1) list2))
	  (cons list1 (append () list2))
	  )
      )
)
;Value: append

(define (decode bits sub_tree tree)
  (if (null? bits) ()
      (if (leaf? sub_tree) (append (symbol-leaf sub_tree) (decode (cdr bits) tree tree))
	  (if (equal? (car bits) '0) (decode (cdr bits) (car sub_tree) tree)
	      (decode (cdr bits) (cdr sub_tree) tree)
	      )
	  )
      )
)
;Value: decode

(define sample_tree (make-code-tree (make-leaf 'A 4) (make-code-tree (make-leaf 'B 2) (make-code-tree (make-leaf 'C 1) (make-leaf 'D 1)))))
;Value: sample_tree

sample_tree
;Value 11: ((leaf a 4) ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;Value: sample_message

(car sample_message)
;Value: 0

(symbol (car sample_message))
;Value: |0|

(symbol? (car sample_message))
;Value: #f

(equal? (car sample_message) 0)
;Value: #t

(equal? (car sample_message) '0)
;Value: #t

(equal? 0 '0)
;Value: #t

(car sample_tree)
;Value 12: (leaf a 4)

(cdr sample_tree)
;Value 13: (((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(cadr sample_tree)
;Value 14: ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4)

(cddr sample_tree)
;Value 15: ((a b c d) 8)

(cdr (cdr sample_tree))
;Value 15: ((a b c d) 8)

sample_tree
;Value 11: ((leaf a 4) ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(cdr sample_tree)
;Value 13: (((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(cadr sample_tree)
;Value 14: ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4)

(car sample_tree)
;Value 12: (leaf a 4)

(caddr sample_tree)
;Value 16: (a b c d)

(cddr sample_tree)
;Value 15: ((a b c d) 8)

(cdr (cadr sample_tree))
;Value 17: (((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4)

(cadr (cadr sample_tree))
;Value 18: ((leaf c 1) (leaf d 1) (c d) 2)

(caadr sample_tree)
;Value 19: (leaf b 2)

(caaddr sample_tree)
;Value: a

(define (decode bits sub_tree tree)
  (if (null? bits) ()
      (if (leaf? sub_tree) (append (symbol-leaf sub_tree) (decode (cdr bits) tree tree))
	  (if (equal? (car bits) '0) (decode (cdr bits) (cadr sub_tree) tree)
	      (decode (cdr bits) (cadr (cadr sub_tree)) tree)
	      )
	  )
      )
)
;Value: decode

(decode sample_message sample_tree sample_tree)
;The object d, passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify an argument to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

sample_message
;Value 20: (0 1 1 0 0 1 0 1 0 1 1 1 0)

(cdr sample_message)
;Value 21: (1 1 0 0 1 0 1 0 1 1 1 0)

sample_tree
;Value 11: ((leaf a 4) ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(cadr sample_tree)
;Value 14: ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4)

(cadr (cadr sample_tree))
;Value 18: ((leaf c 1) (leaf d 1) (c d) 2)

(define (decode bits sub_tree tree)
  (if (null? bits) ()
      (if (leaf? sub_tree) (append (symbol-leaf sub_tree) (decode (cdr bits) tree tree))
	  (if (equal? (car bits) '0) (decode (cdr bits) (car sub_tree) tree)
	      (decode (cdr bits) (cadr sub_tree) tree)
	      )
	  )
      )
)
;Value: decode

(decode sample_message sample_tree sample_tree)
;Value 22: (a b b a ())

(c

(define (decode bits sub_tree tree)
  (if (null? bits) ()
      (if (leaf? sub_tree) (append (symbol-leaf sub_tree) (decode bits tree tree))
	  (if (equal? (car bits) '0) (decode (cdr bits) (car sub_tree) tree)
	      (decode (cdr bits) (cadr sub_tree) tree)
	      )
	  )
      )
)
;Value: decode

(decode sample_message sample_tree sample_tree)
;Value 23: (a c a b b d ())

sample_message
;Value 20: (0 1 1 0 0 1 0 1 0 1 1 1 0)

(define (decode bits sub_tree tree)
  (if (leaf? sub_tree) (append (symbol-leaf sub_tree) (decode bits tree tree))
      (if (null? bits) ()
	  (if (equal? (car bits) '0) (decode (cdr bits) (car sub_tree) tree)
	      (decode (cdr bits) (cadr sub_tree) tree)
	      )
	  )
      )
)
;Value: decode

(decode sample_message sample_tree sample_tree)
;Value 25: (a c a b b d a ())


