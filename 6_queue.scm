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

(define dual_ptr (cons () ()))
;Value: dual_ptr

dual_ptr
;Value 11: (())

(set-car! dual_ptr (cons 0 0))
;Unspecified return value

dual_ptr
;Value 11: ((0 . 0))

(set-cdr! dual_ptr (cons 1 1))
;Unspecified return value

dual_ptr
;Value 11: ((0 . 0) 1 . 1)

(car dual_ptr)
;Value 12: (0 . 0)

(cdr dual_ptr)
;Value 13: (1 . 1)


(define (make-queue)
  (let (
	(queue_ptr (cons () ()))
	)
    (define (get-head) (car queue_ptr))
    (define (get-tail) (cdr queue_ptr))
    (define (get-key element)
      (if (null? element) 0 (car (car element))
	  )
      )
    (define (get-item element)
      (if (null? element) () (cdr (car element))
	  )
      )
    (define (make-new-element item)
      (let (
	    (tail_key (get-key (get-tail)))
	    )
	(cons (cons (+ tail_key 1) item) ())
	)
      )
    (define (insert-queue item)
      (let (
	    (new_element (make-new-element item))
	    (head_element (get-head))
	    (last_element (get-tail))
	    )
	(if (null? head_element) 
	    (begin
	      (set-car! queue_ptr new_element)
	      (set-cdr! queue_ptr new_element)
	      )
	    (if (null? last_element) (set-cdr! queue_ptr new_element)
		(begin
		  (set-cdr! last_element new_element)
		  (set-cdr! queue_ptr new_element)
		  )
		)
	    )
	)
      queue_ptr
      )
    (define (read-queue)
      (let (
	    (head_element (get-head))
	    )
	(set-car! queue_ptr (cdr head_element))
	(car head_element)
	)
      )
    (define (queue op . args)
      (cond
       ((equal? op 'put) (insert-queue (car args)))
       ((equal? op 'get) (read-queue))
       ((equal? op 'get-queue) queue_ptr)
       (else (error "undefined queue operation -" op))
       )
      )
    queue
    )
)
;Value: make-queue

(define q (make-queue))
;Value: q

(q 'put 0)
;Value 30: (((1 . 0)) (1 . 0))

(q 'put 1)
;Value 30: (((1 . 0) (2 . 1)) (2 . 1))

(q 'put 2)
;Value 30: (((1 . 0) (2 . 1) (3 . 2)) (3 . 2))

(q 'get)
;Value 31: (1 . 0)

(q 'get-queue)
;Value 30: (((2 . 1) (3 . 2)) (3 . 2))

(q 'put 3)
;Value 30: (((2 . 1) (3 . 2) (4 . 3)) (4 . 3))

(q 'get)
;Value 32: (2 . 1)

(q 'get)
;Value 33: (3 . 2)

(q 'get-queue)
;Value 30: (((4 . 3)) (4 . 3))

		  