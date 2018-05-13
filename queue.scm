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

(define (make-queue queue)
  (define (empty? queue)
    (if (and (equal? (car queue) ()) (equal? (cdr queue) ())) true false)
    )
  (define (new-pair item)
    (cons item ())
    )
  (define (insert-item queue item)
    (let (
	  (new_pair (new-pair item))
	  )
      (if (empty? queue)
	  (begin
	   (set-car! queue new_pair)
	   (set-cdr! queue new_pair)
	   )
	  (begin
	   (set-cdr! (cdr queue) new_pair)
	   (set-cdr! queue new_pair)
	   )
	  )
      )
    queue
    )
  (define (delete-item queue)
    (if (empty? queue)
	queue
	(set-car! queue (cdr (car queue)))
	)
    queue
    )
  (define (dispatch op item)
    (cond ((equal? op 'insert-item) (insert-item queue item))
	  ((equal? op 'delete-item) (delete-item queue))
	  (else (error "undefine operation - " op))
	  )
    )
  dispatch
)
;Value: make-queue

(define q1 (make-queue (cons () ())))
;Value: q1

(pp q1)
(named-lambda (dispatch op item)
  (cond ((equal? op 'insert-item) (insert-item queue item))
        ((equal? op 'delete-item) (delete-item queue))
        (else (error "undefine operation - " op))))
;Unspecified return value

(q1 'insert-item 'a)
;Value 11: ((a) a)

(q1 'insert-item 'b)
;Value 11: ((a b) b)

(q1 'insert-item 'c)
;Value 11: ((a b c) c)

(car q1)
;The object #[compound-procedure 12 dispatch], passed as the first argument to car, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify an argument to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (make-queue queue)
  (define (empty? queue)
    (if (and (equal? (car queue) ()) (equal? (cdr queue) ())) true false)
    )
  (define (new-pair item)
    (cons item ())
    )
  (define (insert-item queue item)
    (let (
	  (new_pair (new-pair item))
	  )
      (if (empty? queue)
	  (begin
	   (set-car! queue new_pair)
	   (set-cdr! queue new_pair)
	   )
	  (begin
	   (set-cdr! (cdr queue) new_pair)
	   (set-cdr! queue new_pair)
	   )
	  )
      )
    queue
    )
  (define (delete-item queue)
    (if (empty? queue)
	queue
	(set-car! queue (cdr (car queue)))
	)
    queue
    )
  (define (get-queue) queue)
  (define (dispatch op item)
    (cond ((equal? op 'insert-item) (insert-item queue item))
	  ((equal? op 'delete-item) (delete-item queue))
	  ((equal? op 'get-queue) (get-queue))
	  (else (error "undefine operation - " op))
	  )
    )
  dispatch
)
;Value: make-queue


(cons 'a ())
;Value 13: (a)


(define q1 (make-queue (cons () ())))
;Value: q1

(pp q1)
(named-lambda (dispatch op item)
  (cond ((equal? op 'insert-item) (insert-item queue item))
        ((equal? op 'delete-item) (delete-item queue))
        ((equal? op 'get-queue) (get-queue))
        (else (error "undefine operation - " op))))
;Unspecified return value

(q1 'insert-queue 'a)
;undefine operation -  insert-queue
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(q1 'insert-item 'a)
;Value 16: ((a) a)

(q1 'get-queue)
;The procedure #[compound-procedure 17 dispatch] has been called with 1 argument; it requires exactly 2 arguments.
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (make-queue queue)
  (define (empty? queue)
    (if (and (equal? (car queue) ()) (equal? (cdr queue) ())) true false)
    )
  (define (new-pair item)
    (cons item ())
    )
  (define (insert-item queue item)
    (let (
	  (new_pair (new-pair item))
	  )
      (if (empty? queue)
	  (begin
	   (set-car! queue new_pair)
	   (set-cdr! queue new_pair)
	   )
	  (begin
	   (set-cdr! (cdr queue) new_pair)
	   (set-cdr! queue new_pair)
	   )
	  )
      )
    queue
    )
  (define (delete-item queue)
    (if (empty? queue)
	queue
	(set-car! queue (cdr (car queue)))
	)
    queue
    )
  (define (get-queue) queue)
  (define (dispatch op . item)
    (cond ((equal? op 'insert-item) (insert-item queue (car item)))
	  ((equal? op 'delete-item) (delete-item queue))
	  ((equal? op 'get-queue) (get-queue))
	  (else (error "undefine operation - " op))
	  )
    )
  dispatch
)
;Value: make-queue

(define q1 (make-queue (cons () ())))
;Value: q1

(q1 'get-queue)
;Value 18: (())

(q1 'insert-item 'a)
;Value 18: (((a)) (a))

(q1 'get-queue)
;Value 18: (((a)) (a))

(q1 'insert-item 'b)
;Value 18: (((a) (b)) (b))

(q1 'insert-item 'c)
;Value 18: (((a) (b) (c)) (c))

(car (q1 'get-queue))
;Value 19: ((a) (b) (c))

(cdr (q1 'get-queue))
;Value 20: ((c))

(cdr (cdr (q1 'get-queue)))
;Value: ()

(car (cdr (q1 'get-queue)))
;Value 21: (c)

(cadr (cdr (q1 'get-queue)))
;The object (), passed as an argument to safe-car, is not a pair.
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(cadr (q1 'get-queue))
;Value 21: (c)

(car (car (cdr (q1 'get-queue))))
;Value: c

(cdr (car (cdr (q1 'get-queue))))
;Value: ()

(cons (cons 'a ()) ())
;Value 22: ((a))

(define (arg-test . args) args)
;Value: arg-test

(arg-test 'a)
;Value 23: (a)

(arg-test 'a 'b)
;Value 24: (a b)

(arg-test 'a 'b 'c)
;Value 25: (a b c)



(car (arg-test 'a))
;Value: a

(cdr (arg-test 'a))
;Value: ()

(define (make-queue queue)
  (define (empty? queue)
    (if (and (equal? (car queue) ()) (equal? (cdr queue) ())) true false)
    )
  (define (new-pair item)
    (cons item ())
    )
  (define (insert-item queue item)
    (let (
	  (new_pair (new-pair item))
	  )
      (if (empty? queue)
	  (begin
	   (set-car! queue new_pair)
	   (set-cdr! queue new_pair)
	   )
	  (begin
	   (set-cdr! (cdr queue) new_pair)
	   (set-cdr! queue new_pair)
	   )
	  )
      )
    queue
    )
  (define (delete-item queue)
    (if (empty? queue)
	queue
	(set-car! queue (cdr (car queue)))
	)
    queue
    )
  (define (get-queue) queue)
  (define (dispatch op . item)
    (cond ((equal? op 'insert-item) (insert-item queue (car item)))
	  ((equal? op 'delete-item) (delete-item queue))
	  ((equal? op 'get-queue) (get-queue))
	  (else (error "undefine operation - " op))
	  )
    )
  dispatch
)
;Value: make-queue

(define q1 (make-queue (cons () ())))
;Value: q1

(q1 'get-queue)
;Value 26: (())

(q1 'insert-item 'a)
;Value 26: ((a) a)

(q1 'insert-item 'b)
;Value 26: ((a b) b)

(q1 'insert-item 'c)
;Value 26: ((a b c) c)

(cdr (q1 'get-queue))
;Value 27: (c)

(car (q1 'get-queue))
;Value 28: (a b c)

(cdr (car (q1 'get-queue)))
;Value 29: (b c)

(q1 'delete-queue)
;undefine operation -  delete-queue
;To continue, call RESTART with an option number:
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(q1 'delete-item)
;Value 26: ((b c) c)

