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

(define (clear! cell) (set-car! cell false))
;Value: clear!


(define (test-and-set! cell)
  (if (car cell) true
      (begin
	(set-car! cell true)
	false
	)
      )
)
;Value: test-and-set!


(define (make-mutex)
  (let (
	(cell (list false))
	)
    (define (the-mutex op)
      (cond
       ((equal? op 'acquire) 
	(if (test-and-set! cell) (the-mutex 'acquire))
	(display '(mutex acquired))
	)
       ((equal? op 'release) 
	(clear! cell)
	(display '(mutex released))
	)
       )
      )
    the-mutex
    )
)
;Value: make-mutex


(define (make-serializer)
  (let (
	(mutex (make-mutex))
	)
    (lambda (p)
      (define (serialized-p . args)
	(mutex 'acquire)
	(let (
	      (val (apply p args))
	      )
	  (mutex 'release)
	  val
	  )
	)
      serialized-p
      )
    )
)
;Value: make-serializer


(define (make-account-and-serializer balance)
  (define (withdraw amount)
    (if (>= balance amount) (set! balance (- balance amount))
	(error "Insufficient amount of balance -" balance)
	)
    )
  (define (deposit amount)
    (set! balance (+ balance amount))
    )
  (let (
	(balance-serializer (make-serializer))
	)
    (define (dispatch op)
      (cond
       ((equal? op 'withdraw) withdraw)
       ((equal? op 'deposit) deposit)
       ((equal? op 'balance) balance)
       ((equal? op 'serializer) balance-serializer)
       (else (error "Undefined operation -- MAKE-ACC-AND-SERIALIZER -" op))
       )
      )
    dispatch
    )
)
;Value: make-account-and-serializer

(define (exchange acc1 acc2)
  (let (
	(diff (- (acc1 'balance) (acc2 'balance))))
    (cond
     ((<= diff 0) ((acc1 'deposit) (abs diff)) ((acc2 'withdraw) (abs diff)))
     (else ((acc1 'withdraw) diff) ((acc2 'deposit) diff)))
    )
)
;Value: exchange

(define (serialized-exchange acc1 acc2)
  (let (
	(serializer1 (acc1 'serializer))
	(serializer2 (acc2 'serializer)))
    ((serializer1 (serializer2 exchange)) acc1 acc2)
    )
)
;Value: serialized-exchange

(define acc1 (make-account-and-serializer 50))
(define acc2 (make-account-and-serializer 100))
;Value: acc1

;Value: acc2

(acc1 'balance)
(acc2 'balance)
;Value: 50

;Value: 100

(serialized-exchange acc1 acc2)
(mutex acquired)(mutex acquired)(mutex released)(mutex released)
;Value: 100


(acc1 'balance)
(acc2 'balance)
;Value: 100

;Value: 50

