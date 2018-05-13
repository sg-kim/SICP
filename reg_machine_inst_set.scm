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

(assoc 'a (list (list 'a 1) (list 'b 2)))
;Value 11: (a 1)

(define (make-machine register-names ops controller-text)
  (let (
	(machine (make-new-machine))
	)
    (for-each (lambda (register-name) ((machine 'allocate-register) register-name)) register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence) (assemble controller-text machine))
    machine
    )
)

(define (make-register name)
  (let (
	(contents '*unassigned*)
	)
    (define (dispatch message)
      (cond (
	     (equal? message 'get) constents
	     )
	    (
	     (equal? message 'set) (lambda (value) (set! contents value))
	     )
	    (else (error "Unknown request -- REGISTER " message))
	    )
      )
    dispatch
    )
)

(define (get-contents register) (register 'get))
(define (set-contents! register value) ((register 'set) value))

(define (make-stack)
  (let (
	(s '())
	)
    (define (push x) (set! s (cons x s)))
    (define (pop)
      (if (null? s) (error "Empty stack -- POP")
	  (let (
		(top (car s))
		)
	    (set! s (cdr s))
	    top
	    )
	  )
      )
    (define (initialize)
      (set! s '())
      'done
      )
    (define (dispatch message)
      (cond (
	     (equal? message 'push) push
	     )
	    (
	     (equal? message 'pop) (pop)
	     )
	    (
	     (equal? message 'initialize) (initialize)
	     )
	    (else (error "Unknown request -- STACK" message))
	    )
      )
    dispatch
    )
)

(define (pop stack) (stack 'pop))
(define (push stack value) ((stack 'push) value))

(define (make-new-machine)
  (let (
	(pc (make-register 'pc))
	(flag (make-register 'flag))
	(stack (make-stack))
	(the-instruction-sequence '())
	)
    (let (
	  (the-ops
	   (list (list 'initialize-stack (lambda () (stack 'initialize))))
	   )
	  (register-table
	   (list (list 'pc pc) (list 'flag flag))
	   )
	  )
      (define (allocate-register name)
	(if (assoc name register-table)
	    (error "Multiply defined register: " name)
	    (set! register-table
		  (cons (list name (make-register name)) register-table)
		  )
	    )
	'register-allocated
	)
      (define (lookup-register name)
	(let (
	      (val (assoc name register-table))
	      )
	  (if val (cadr val) (error "Unknown register: " name))
	  )
	)
      (define (execute)
	(let (
	      (insts (get-contents pc))
	      )
	  (if (null? insts) 'done
	      (begin
		((instruction-execution-proc (car insts)))
		(execute)
		)
	      )
	  )
	)
      (define (dispatch message)
	(cond (
	       (equal? message 'start)
	       (set-contents! pc the-instruction-sequence)
	       (execute)
	       )
	      (
	       (equal? message 'install-instruction-sequence)
	       (lambda (seq) (set! the-instruction-sequence seq))
	       )
	      (
	       (equal? message 'allocate-register) allocate-register
	       )
	      (
	       (equal? message 'get-register) lookup-register
	       )
	      (
	       (equal? message 'install-operations)
	       (lambda (ops) (set! the-ops (append the-ops ops)))
	       )
	      (
	       (equal? message 'stack) stack
	       )
	      (
	       (equal? message 'operations) the-ops
	       )
	      (else
	       (error "Unknown request -- MACHINE " message)
	       )
	      )
	)
      dispatch
      )
    )
)

(define (start machine) (machine 'start))
(define (get-register-contetnts machine register-name)
  (get-contents (get-register machine register-name))
)
(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done
)

;Value: make-machine

;Value: make-register

;Value: get-contents

;Value: set-contents!

;Value: make-stack

;Value: pop

;Value: push

;Value: make-new-machine

;Value: start

;Value: get-register-contetnts

;Value: set-register-contents!

(define (assemble controller-text machine)
  (extract-labels controller-text
		  (lambda (insts labels) (update-insts! insts labels machine) insts)
		  )
)

(define (extract-labels text receive)
  (if (null? text) (receive '() '())
      (extract-labels (cdr text)
		      (lambda (insts labels)
			(let (
			      (next-inst (car text))
			      )
			  (if (symbol? next-inst)
			      (receive insts (cons (make-label-entry next-inst insts) lebels))
			      (receive (cons (make-instruction next-inst) insts) labels)
			      )
			  )
			)
		      )
      )
)

(define (update-insts! insts labels machine)
  (let (
	(pc (get-register machine 'pc))
	(flag (get-register machine 'flag))
	(stack (machine 'stack))
	(ops (machine 'operations))
	)
    (for-each
     (lambda (inst) 
       (set-instruction-execution-proc! 
	inst 
	(make-execution-procedure (instruction-text inst) labels machine pc flag stack ops)
	)
       )
     insts)
    )
)

(define (make-instruction text) (cons text '()))
(define (instruction-text inst) (car inst))
(define (instruction-execution-proc inst) (cdr inst))
(define (set-instruction-execution-proc! inst proc) (set-cdr! inst proc))

(define (make-label-entry label-name insts) (cons label-name insts))

(define (lookup-label labels label-name)
  (let (
	(val (assoc lable-name labels))
	)
    (if val (cdr val)
	(error "Undefined label -- ASSEMBLE " label-name)
	)
    )
)
;Value: make-instruction

;Value: instruction-text

;Value: instruction-execution-proc

;Value: set-instruction-execution-proc!

;Value: make-label-entry

;Value: lookup-label

(define (make-execution-procedure inst labels machine pc flag stack ops)
  (cond (
	 (equal? (car inst) 'assign) (make-assign inst machine labels ops pc)
	 )
	(
	 (equal? (car inst) 'test) (make-test inst machine labels ops flag pc)
	 )
	(
	 (equal? (car inst) 'branch) (make-branch inst machine labels flag pc)
	 )
	(
	 (equal? (car inst) 'goto) (make-goto inst machine stack pc)
	 )
	(
	 (equal? (car inst) 'save) (make-save inst machine stack pc)
	 )
	(
	 (equal? (car inst) 'restore) (make-restore inst machine stack pc)
	 )
	(
	 (equal? (car inst) 'perform) (make-perform inst machine labels ops pc)
	 )
	(else (error "Unknown instruction type -- ASSEMBLE " inst))
	)
)
;Value: make-execution-procedure

(define (make-assign inst machine labels operations pc)
  (let (
	(target (get-register machine (assign-reg-name inst)))
	(value-exp (assign-value-exp inst))
	)
    (let (
	  (value-proc
	   (if (operation-exp? value-exp) (make-operation-exp value-exp machine labels operations)
	       (make-primitive-exp (car value-exp) machine labels)
	       )
	   )
	  )
      (lambda () (set-contents! target (value-proc))
	      (advance-pc pc)
	      )
      )
    )
)
;Value: make-assign

(define (assign-reg-name assign-instruction) (cadr assign-instruction))
(define (assign-value-exp assign-instruction) (addr assign-instruction))
;Value: assign-reg-name

;Value: assign-value-exp

(define (advance-pc pc) (set-contents! pc (cdr (get-contents pc))))
;Value: advance-pc

(pp operation-exp?)
;Unbound variable: operation-exp?
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of operation-exp?.
; (RESTART 2) => Define operation-exp? to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(pp tagged-list?)
;Unbound variable: tagged-list?
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of tagged-list?.
; (RESTART 3) => Define tagged-list? to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n


(define (make-stack)
  (let (
	(s '())
	(number-pushes 0)
	(max-depth 0)
	(current-depth 0)
	)
    (define (push x) 
      (set! s (cons x s))
      (set! number-pushes (+ 1 number-pushes))
      (set! current-depth (+ 1 current-depth))
      (set! max-depth (max current-depth max-depth))
      )
    (define (pop)
      (if (null? s) (error "Empty stack -- POP")
	  (let (
		(top (car s))
		)
	    (set! s (cdr s))
	    (set! current-depth (- current-depth 1))
	    top
	    )
	  )
      )
    (define (initialize)
      (set! s '())
      (set! number-pushes 0)
      (set! max-depth 0)
      (set! current-depth 0)
      'done
      )
    (define (print-stats)
      (newline)
      (display (list 'total-pushes '= number-pushes
		     'maximum-depth '= max-depth))
      )
    (define (dispatch message)
      (cond (
	     (equal? message 'push) push
	     )
	    (
	     (equal? message 'pop) (pop)
	     )
	    (
	     (equal? message 'initialize) (initialize)
	     )
	    (
	     (equal? message 'print-stats) (print-stats)
	     )
	    (else (error "Unknown request -- STACK" message))
	    )
      )
    dispatch
    )
)
;Value: make-stack

(display (list 'a '= 3 'b '= 2))
(a = 3 b = 2)
;Unspecified return value

