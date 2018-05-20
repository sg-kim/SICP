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
  (let (
	 (value false)
	 (informant false)
	 (constraints ())
	 )
	(define (set-my-value newval setter)
	  (cond 
	   ((not (has-value? me)) 
	    (set! value newval)
	    (set! informant setter)
	    (for-each-except setter inform-about-value constraints))
	   ((not (= value newval))
	    (error "Contradiction" (list value newval)))
	   (else 'ignored)
	   )
	  )
	(define (forget-my-value retractor)
	  (if (equal? retractor informant)
	      (begin
		(set! informant false)
		(for-each-except retractor inform-about-no-value constraints)
		)
	      'ignored)
	  )
	(define (connect new-constraint)
	  (if (not (memq new-constraint constraints))
	      (set! constraints (cons new-constraint constraints)))
	  (if (has-value? me)
	      (inform-about-value new-constraint))
	  'done)
	(define (me op)
	  (cond 
	   ((equal? op 'has-value?) (if informant true false))
	   ((equal? op 'value) value)
	   ((equal? op 'set-value!) set-my-value)
	   ((equal? op 'forget) forget-my-value)
	   ((equal? op 'connect) connect)
	   (else (error "Undefined operation -- CONNECTOR - " op))
	   )
	  )
	me
	)
)
;Value: make-connector

(define (adder a b sum)
  (define (process-new-value)
    (cond (
	   (and (has-value? a) (has-value? b)) (set-value! sum (+ (get-value a) (get-value b)) me)
	   (and (has-value? a) (has-value? sum)) (set-value! b (- (get-value sum) (get-value a)) me)
	   (and (has-value? b) (has-value? sum)) (set-value! a (- (get-value sum) (get-value b)) me)
	   )
	  )
    )
  (define (process-forget-value)
    (forget-value! sum me)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me op)
    (cond 
     ((equal? op 'I-have-a-value) (process-new-value))
     ((equal? op 'I-lost-my-value) (process-forget-value))
     (else (error "Unknown op -- ADDER - " op))
     )
    )
  (connect a me)
  (connect b me)
  (connect sum me)
  me
)

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

(define (constant value connector)
  (define (me op)
    (error "Undefined operation -- CONSTANT - " op)
    )
  (connect connector me)
  (set-value! connector value me)
  me
)
;Value: adder

;Value: multiplier

;Value: constant

(define (for-each-except exception procedure list)
  (define (loop items)
    (cond ((null? items) 'done)
	  ((equal? (car items) exception) (loop (cdr items)))
	  (else (procedure (car items)) (loop (cdr items)))
	  )
    )
  (loop list)
)
;Value: for-each-except

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

(define (averager)
  (let (
	(a (make-connector))
	(b (make-connector))
	(c (make-connector))
	(u (make-connector))
	(v (make-connector))
	)
    (adder a b u)
    (multiplier c v u)
    (constant 2 v)
    (probe 'Input_A a)
    (probe 'Input_B b)
    (probe 'Output_C c)
    (define (module_averager op . args)
      (cond
       ((equal? op 'set-a!) (set-value! a (car args) (cadr args)))
       ((equal? op 'set-b!) (set-value! b (car args) (cadr args)))
       ((equal? op 'set-c!) (set-value! c (car args) (cadr args)))
       ((equal? op 'forget-a!) (forget-value! a (car args)))
       ((equal? op 'forget-b!) (forget-value! b (car args)))
       ((equal? op 'forget-c!) (forget-value! c (car args)))
       ((equal? op 'get-a) (get-value a))
       ((equal? op 'get-b) (get-value b))
       ((equal? op 'get-c) (get-value c))
       ((equal? op 'has-a?) (has-value? a))
       ((equal? op 'has-b?) (has-value? b))
       ((equal? op 'has-c?) (has-value? c))
       ((equal? op 'show-net)
	(display '(a b <--> adder <--> u))
	(newline)
	(display '(c v <--> multiplier <--> u))
	(newline)
	(display '(v = 2)))
       )
      )
    module_averager
    )
)
;Value: averager

(define avg (averager))
;Value: avg

(avg 'set-a! 10 'user)
(avg 'set-b! 20 'user)

Probe: input_a = 10
;Value: done


Probe: input_b = 20
Probe: output_c = 15
;Value: done

(avg 'forget-a! 'user)
(avg 'forget-b! 'user)

Probe: input_a = ?
Probe: output_c = ?
;Value: done


Probe: input_b = ?
;Value: done

(avg 'set-a! 17.0 'user)
(avg 'set-b! 10.0 'user)

Probe: input_a = 17.
;Value: done


Probe: input_b = 10.
Probe: output_c = 13.5
;Value: done
