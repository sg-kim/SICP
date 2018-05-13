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

(define (make-connector)
  (let
      (
       (value false)
       (informant false)
       (constraints '())
       )
    (define (set-my-value newval setter)
      (cond ((not (has-value? me))
	     (set! value newval)
	     (set! informant setter)
	     (for-each-except setter inform-about-value constraints)
	     )
	    ((not (= value newval))
	     (error "Contradiction - " (list value newval)))
	    (else 'ingnored)
	    )
      )
    (define (forget-my-value retractor)
      (if (equal? retractor informant)
	  (begin
	    (set! informant false)
	    (for-each-except retractor inform-about-no-value constraints)
	    )
	  'ignored
	  )
      )
    (define (connect new-constraint)
      (if (not (memq new-constraint constraints))
	  (set! constraints (cons new-constraint constraints))
	  )
      (if (has-value? me) (inform-about-value new-constraint))
      'done)
    (define (me op)
      (cond ((equal? op 'has-value?) (if informant true false))
	    ((equal? op 'value) value)
	    ((equal? op 'set-value!) set-my-value)
	    ((equal? op 'forget) forget-my-value)
	    ((equal? op 'connect) connect)
	    (else (error "Undefined operation - " op))
	    )
      )
    me
    )
)
;Value: make-connector

(define (multiplier m1 m2 product)
  (define (process-new-value)
    (cond
     ((or (and (has-value? m1) (= (get-value m1) 0))
	  (and (has-value? m2) (= (get-value m2) 0))) (set-value! product 0 me))
      ((and (has-value? m1) (has-value? m2)) (set-value! product (* (get-value m1) (get-value m2)) me))
      ((and (has-value? m1) (has-value? product)) (set-value! m2 (/ (get-value product) (get-value m1)) me))
      ((and (has-value? m2) (has-value? product)) (set-value! m1 (/ (get-value product) (get-value m2)) me))
      )
    )
  (define (process-forget-value)
    (forget-value! product me)
    (forget-value! m1 me)
    (forget-value! m2 me)
    (process-new-value)
    )
  (define (me op)
    (cond
     ((equal? op 'I-have-a-value) (process-new-value))
     ((equal? op 'I-lost-my-value) (process-forget-value))
     (else (error "undefined op - MULTIPLIER - " op))
     )
    )
  (connect m1 me)
  (connect m2 me)
  (connect product me)
  me
)
;Value: multiplier

(define (adder a1 a2 sum)
  (define (process-new-value)
    (cond
     ((and (has-value? a1) (has-value? a2))
      (set-value! sum (+ (get-value a1) (get-value a2)) me)
      )
     ((and (has-value? a1) (has-value? sum))
      (set-value! a2 (- (get-value sum) (get-value a2)) me)
      )
     ((and (has-value? a2) (has-value? sum))
      (set-value! a1 (- (get-value sum) (get-value a1)) me)
      )
     )
    )
  (define (process-forget-value)
    (forget-value! sum me)
    (forget-value! a1 me)
    (forget-value! a2 me)
    (process-new-value)
    )
  (define (me op)
    (cond
     ((equal? op 'I-have-a-value) (process-new-value))
     ((equal? op 'I-lost-my-value) (process-forget-value))
     (else (error "Undefined operation -- Adder - " op))
     )
    )
  (connect a1 me)
  (connect a2 me)
  (connect sum me)
)
;Value: adder

(define (inform-about-value constraint) (constraint 'I-have-a-value))
(define (inform-about-no-value constraint) (constraint 'I-lost-my-value))
;Value: inform-about-value

;Value: inform-about-no-value

(define (has-value? connector) (connector 'has-value?))
(define (get-value connector) (connector 'value))
(define (set-value! connector new-value informant) ((connector 'set-value!) new-value informant))
(define (forget-value! connector retractor) ((connector 'forget) retractor))
(define (connect connector new-constraint) ((connector 'connect) new-constraint))
;Value: has-value?

;Value: get-value

;Value: set-value!

;Value: forget-value!

;Value: connect

(define (constant value connector)
  (define (me op)
    (error "undefined op -- CONSTANT - " op)
    )
  (connect connector me)
  (set-value! connector value me)
  me
)
;Value: constant

(define (probe name connector)
  (define (print-probe value)
    (newline)
    (display "Probe: ")
    (display name)
    (display " = ")
    (display value)
    )
  (define (process-new-value)
    (print-probe (get-value connector))
    )
  (define (process-forget-value)
    (print-probe "?")
    )
  (define (me op)
    (cond
     ((equal? op 'I-have-a-value) (process-new-value))
     ((equal? op 'I-lost-my-value) (process-forget-value))
     (else (error "undefined operation -- PROBE - " op))
     )
    )
  (connect connector me)
  me
)
;Value: probe

(define C (make-connector))
(define F (make-connector))
;Value: c

;Value: f

(define (celsius-fahrenheit-converter c f)
  (let
      (
       (u (make-connector))
       (v (make-connector))
       (w (make-connector))
       (x (make-connector))
       (y (make-connector)))
    (multiplier c w u)
    (multiplier v x u)
    (adder v y f)
    (constant 9 w)
    (constant 5 x)
    (constant 32 y)
    'ok
    )
)
;Value: celsius-fahrenheit-converter

(celsius-fahrenheit-converter C F)
;Unbound variable: for-each-except
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of for-each-except.
; (RESTART 2) => Define for-each-except to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (for-each-except exception procedure list)
  (define (loop items)
    (cond
     ((null? items) 'done)
     ((equal? (car items) exception) (loop (cdr items)))
     (else (procedure (car items)) (loop (cdr items)))
     )
    )
  (loop list)
)
;Value: for-each-except

(celsius-fahrenheit-converter C F)
;Value: ok

(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)
;Value 11: #[compound-procedure 11 me]

;Value 12: #[compound-procedure 12 me]

(set-value! C 25 'user)

Probe: Celsius temp = 25
Probe: Fahrenheit temp = 77
;Value: done

(set-value! F 212 'user)
;Contradiction -  (77 212)
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(forget-value! C 'user)

Probe: Celsius temp = ?
Probe: Fahrenheit temp = ?
;Value: done

(set-value! F 212 'user)

Probe: Fahrenheit temp = 212
Probe: Celsius temp = 835/9
;Value: done

