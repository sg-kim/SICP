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

(pp assoc)
(named-lambda (assoc key alist #!optional =)
  (let ((= (if (eq? = #!default) equal? =)))
    (let ((lose (lambda () (error:not-alist alist 'assoc))))
      (declare (no-type-checks))
      (let loop ((alist alist))
        (if (pair? alist)
            (begin (if (not (pair? (car alist))) (lose)) (if (= (car (car alist)) key) (car alist) (loop (cdr alist))))
            (begin (if (not (null? alist)) (lose)) #f))))))
;Unspecified return value

(assoc 'a (list 'a 'b))
;The object (a b), passed as an argument to assoc, is not an association list.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(assoc 'a (list (list 'a 1) (list 'b 2)))
;Value 12: (a 1)

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
;Value: make-machine

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
;Value: make-register

(define (get-contents register) (register 'get))
(define (set-contents! register value) ((register 'set) value))
;Value: get-contents

;Value: set-contents!

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
;Value: make-stack

(define (pop stack) (stack 'pop))
(define (push stack value) ((stack 'push) value))
;Value: pop

;Value: push


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
;Value: make-new-machine

(define (start machine) (machine 'start))
(define (get-register-contetnts machine register-name)
  (get-contents (get-register machine register-name))
)
(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done
)
;Value: start

;Value: get-register-contetnts

;Value: set-register-contents!

(define (assemble controller-text machine)
  (extract-labels controller-text
		  (lambda (insts labels) (update-insts! insts labels machine))
		  )
)
;Value: assemble

(define (assemble controller-text machine)
  (extract-labels controller-text
		  (lambda (insts labels) (update-insts! insts labels machine) insts)
		  )
)
;Value: assemble

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
;Value: extract-labels

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
;Value: update-insts!

(define (make-instruction text) (cons text '()))
(define (instruction-text inst) (car inst))
(define (instruction-execution-proc inst) (cdr inst))
(define (set-instruction-execution-proc! inst proc) (set-cdr! inst proc))
;Value: make-instruction

;Value: instruction-text

;Value: instruction-execution-proc

;Value: set-instruction-execution-proc!

(define (make-label-entry label-name insts) (cons label-name insts))
;Value: make-label-entry

(define (lookup-label labels label-name)
  (let (
	(val (assoc lable-name labels))
	)
    (if val (cdr val)
	(error "Undefined label -- ASSEMBLE " label-name)
	)
    )
)
;Value: lookup-label




