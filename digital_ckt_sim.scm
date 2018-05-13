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

(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))
;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of make-wire.
; (RESTART 2) => Define make-wire to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of make-wire.
; (RESTART 3) => Define make-wire to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of make-wire.
; (RESTART 4) => Define make-wire to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a value to use instead of make-wire.
; (RESTART 5) => Define make-wire to a given value.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of make-wire.
; (RESTART 6) => Define make-wire to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a value to use instead of make-wire.
; (RESTART 7) => Define make-wire to a given value.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify a value to use instead of make-wire.
; (RESTART 8) => Define make-wire to a given value.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 10) => Specify a value to use instead of make-wire.
; (RESTART 9) => Define make-wire to a given value.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

;Unbound variable: make-wire
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify a value to use instead of make-wire.
; (RESTART 10) => Define make-wire to a given value.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (logical-not s)
  (cond ((= s 1) 0)
	((= s 0) 1)
	(else (error "Invalid signal - " s))
	)
)
;Value: logical-not

(define (inverter input output)
  (define (inverter-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay (lambda () (set-signal! output new-value)))
      )
    )
  (add-action! input invert-input)
  'ok
)
;Value: inverter

(define (logical-and a b)
  (if ((and (= a 1) (= b 1))) 1 0)
)
;Value: logical-and

(define (and-gate a b output)
  (define (and-action-procedure)
    (let ((new-value (logical-and (get-signal a) (get-signal b))))
      (after-delay and-gate-delay (lambda () (set-signal! output new-value)))
      )
    )
  (add-action! a and-action-procedure)
  (add-action! b and-action-procedure)
  'ok
)
;Value: and-gate

(define (logical-or a b)
  (if (or (and (= a 1) (= b 0)) (and (= a 0) (= b 1))) 1 0)
)
;Value: logical-or

(define (or-gate a b output)
  (define (or-action-procedure)
    (let (
	  (new-value (logical-or (get-signal a) (get-signal b)))
	  )
      (after-delay or-gate-delay (lambda () (set-signal! output new-value)))
      )
    )
  (add-action! a or-action-procedure)
  (add-action! b or-action-procedure)
  'ok
)
;Value: or-gate

(define (make-wire)
  (let
      ((signal-value 0) (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
	  (begin
	    (set! signal-value new-value)
	    (call-each action-procedures)
	    )
	  'done
	  )
      )
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc)
      )
    (define (dispatch op)
      (cond ((equal? op 'get-signal) signal-value)
	    ((equal? op 'set-signal!) set-my-signal!)
	    ((equal? op 'add-action!) accept-action-procedure!)
	    (else (error "Undefined operation - " op))
	    )
      )
    dispatch
    )
)
;Value: make-wire

(define (call-each procedures)
  (if (null? procedures) 'done
      (begin
	((car procedures)
	 (call-each (cdr procefures)))
	)
      )
)
;Value: call-each

(define (get-signal wire) (wire 'get-signal))
(define (set-signal! wire new-value) ((wire 'set-signal!) new-value))
;Value: get-signal

;Value: set-signal!

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure)
)
;Value: add-action!

(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda)) action the-agenda)
)
;Value: after-delay

(define (propagate)
  (if (empty-agenda? the-agenda) 'done
      (let
	  ((first-item (first-agenda-item the-agenda)))
	(first-item)
	(remove-first-agenda-item! the-agenda)
	(propagate)
	)
      )
)
;Value: propagate

(define (probe name wire)
  (add-action! wire
	       (lambda ()
		 (newline)
		 (display name)
		 (display " ")
		 (display (current-time the-agenda))
		 (display " New-value = ")
		 (display (get-signal wire))
		 )
	       )
)
;Value: probe

(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)
(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))
;Value: inverter-delay

;Value: and-gate-delay

;Value: or-gate-delay

;Value: input-1

;Value: input-2

;Value: sum

;Value: carry

(probe 'sum sum)

sum 
;Unbound variable: the-agenda
;To continue, call RESTART with an option number:
; (RESTART 12) => Specify a value to use instead of the-agenda.
; (RESTART 11) => Define the-agenda to a given value.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (half-adder a b s c)
  (let
      ((d (make-wire))
       (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok
    )
)
;Value: half-adder

(define (full-adder a b c-in sum c-out)
  (let
      ((s (make-wire))
       (c1 (make-wire))
       (c2 (make-wire))
       )
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok
    )
)
;Value: full-adder

(define (make-time-segment time queue) (cons time queue))
(define (segment-time s) (car s))
(define (segment-queue s) (cdr s))
;Value: make-time-segment

;Value: segment-time

;Value: segment-queue

(define (make-agenda) (list 0))
(define (current-time agenda) (car agenda))
(define (set-current-time! agenda time) (set-car! aganda time))
(define (segments agenda) (cdr agenda))
(define (set-segments! agenda segments) (set-cdr! agenda segments))
(define (first-segment agenda) (car (segments agenda)))
(define (rest-segments agenda) (cdr (segments agenda)))
;Value: make-agenda

;Value: current-time

;Value: set-current-time!

;Value: segments

;Value: set-segments!

;Value: first-segment

;Value: rest-segments

(define (empty-agenda? agenda) (null? (segments agenda))
;Unbound variable: agenda
;To continue, call RESTART with an option number:
; (RESTART 13) => Specify a value to use instead of agenda.
; (RESTART 12) => Define agenda to a given value.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (empty-agenda? agenda) (null? (segments agenda)))
;Value: empty-agenda?

(define (add-to-agenda! time action agenda)
  (define (belongs-before? segments)
    (or (null? segments) (< time (segment-time (car segments))))
    )
  (define (make-new-time-segment time action)
    (let (
	  (q (make-queue))
	  )
      (insert-queue! q action)
      (make-time-segment time q)
      )
    )
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
	(insert-queue! (segment-queue (car segments)) action)
	(let
	    (
	     (rest (cdr segments))
	     )
	  (if (belongs-before? rest)
	      (set-cdr! segments (cons (make-new-time-segment time action) (cdr segments)))
	      (add-to-segments! rest)
	      )
	  )
	)
    )
  (let (
	(segments (segments agenda))
	)
    (if (belongs-before? segments)
	(set-segments! agenda (cons (make-new-time-segment time action) segments))
	(add-to-segments! segments)
	)
    )
)
;Value: add-to-agenda!

(define (remove-first-agenda-item! agenda)
  (let
      (
       (q (segment-queue (first-segment agenda)))
       )
    (delete-queue! q)
    (if (empty-queue? q)
	(set-segments! agenda (rest-segments agenda))
	)
    )
)
;Value: remove-first-agenda-item!

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let
	  (
	   (first-seg (first-segment agenda))
	   )
	(set-current-time! agenda (segment-time first-seg))
	(front-queue (segment-queue first-seg))
	)
      )
)
;Value: first-agenda-item

(probe 'sum sum)

sum 
;Unbound variable: the-agenda
;To continue, call RESTART with an option number:
; (RESTART 14) => Specify a value to use instead of the-agenda.
; (RESTART 13) => Define the-agenda to a given value.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

