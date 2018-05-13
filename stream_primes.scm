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

(stream-car (cons-stream 1 2))
;Value: 1

(stream-cdr (cons-stream 1 2))
;Value: 2

(stream-car (cons 1 2))
;The object (1 . 2), passed as an argument to stream-car, is not a stream pair.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

stream
;Value 11: #[compiled-procedure 11 ("stream" #x6) #xf #x1f11a4b]

(apply + (list 1 2))
;Value: 3

(stream-coms)
;Unbound variable: stream-coms
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of stream-coms.
; (RESTART 3) => Define stream-coms to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n


(define (stream-filter cond stream)
  (if (null? stream) ()
      (if (apply cond (stream-car stream)) 
	  (stream-cons (stream-car stream) (stream-filter cond (stream-cdr stream)))
	  (stream-filter cond (stream-cdr stream))
	  )
      )
)
;Value: stream-filter

(define (stream-filter cond stream)
  (if (null? stream) ()
      (if (apply cond (stream-car stream)) 
	  (cons-stream (stream-car stream) (stream-filter cond (stream-cdr stream)))
	  (stream-filter cond (stream-cdr stream))
	  )
      )
)
;Value: stream-filter

(define (integer-starting-from n)
  (cons-stream n (integer-starting-from (+ n 1)))
)
;Value: integer-starting-from

(define (divisible? x y) (= (remainder x y) 0))
;Value: divisible?

(divisible? 4 2)
;Value: #t

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (divisible? x (stream-car stream))) 
		(stream-cdr stream)
		)
	       )
)
;Value: sieve

(define primes (sieve (integer-starting-from 2)))
;Value: primes

(pp primes)
(2 . #[promise 13])
;Unspecified return value

(define (stream-ref stream n)
  (if (= n 1) (stream-car stream)
      (stream-ref (stream-cdr stream) (- n 1))
      )
)
;Value: stream-ref

(stream-ref primes 2)
;apply: Improper argument list 3
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(stream-cdr primes)
;apply: Improper argument list 3
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(stream-car primes)
;Value: 2

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))
;Value: sieve

;Value: primes

primes
;Value 14: (2 . #[promise 15])

(stream-cdr primes)
;apply: Improper argument list 3
;To continue, call RESTART with an option number:
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(pp stream-filter)
(named-lambda (stream-filter cond stream)
  (cond ((null? stream) '())
        ((apply cond (stream-car stream)) (cons (stream-car stream) (delay (stream-filter cond (stream-cdr stream)))))
        (else (stream-filter cond (stream-cdr stream)))))
;Unspecified return value

(define (stream-filter pred stream)
  (if (null? stream) ()
      (if (apply pred (stream-car stream)) 
	  (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)
;Value: stream-filter

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))

;Value: sieve

;Value: primes

primes
;Value 16: (2 . #[promise 17])

(stream-cdr primes)
;apply: Improper argument list 3
;To continue, call RESTART with an option number:
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (stream-filter pred stream)
  (if (null? stream) ()
      (if ((pred (stream-car stream))) 
	  (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))

;Value: stream-filter

;Value: sieve

;Value: primes

primes
;Value 18: (2 . #[promise 19])

(primes)
;The object (2 . #[promise 19]) is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a procedure to use in its place.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(stream-car primes)
;Value: 2

(stream-cdr primes)
;The object #t is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify a procedure to use in its place.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(stream-ref primes 2)
;The object #t is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 10) => Specify a procedure to use in its place.
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

(define (stream-filter pred stream)
  (if (null? stream) ()
      (if (pred (stream-car stream)) 
	  (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))
;Value: stream-filter

;Value: sieve

;Value: primes

primes
;Value 20: (2 . #[promise 21])

(stream-cdr primes)
;Value 22: (3 . #[promise 23])

(stream-ref primes 2)
;Value: 3

(define (stream-filter pred stream)
  (if (null? stream) ()
      (if (apply pred (stream-car stream)) 
	  (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))

;Value: stream-filter

;Value: sieve

;Value: primes

primes
;Value 24: (2 . #[promise 25])

(stream-cdr primes)
;apply: Improper argument list 3
;To continue, call RESTART with an option number:
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

(define (stream-filter pred stream)
  (if (null? stream) ()
      (if (pred (stream-car stream)) 
	  (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (stream-filter
		(lambda (x) (not (divisible? x (stream-car stream))))
		(stream-cdr stream)
		)
	       )
)

(define primes (sieve (integer-starting-from 2)))

;Value: stream-filter

;Value: sieve

;Value: primes

(stream-cdr primes)
;Value 26: (3 . #[promise 27])

(stream-ref primes 10)
;Value: 19

