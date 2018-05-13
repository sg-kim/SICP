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

(pp prime?)
;Unbound variable: prime?
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of prime?.
; (RESTART 2) => Define prime? to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(pp stream-car)
(named-lambda (stream-car stream)
  (guarantee-stream-pair stream 'stream-car)
  (car stream))
;Unspecified return value

(pp stream-null?)
(named-lambda (null? a1)
  (null? a1))
;Unspecified return value

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))
      )
)
;Value: stream-ref

(the-empty-stream)
;The object () is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a procedure to use in its place.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(equal? the-empty-stream ())
;Value: #t


(define (stream-map proc s)
  (if (stream-null? s) the-empty-stream
      (cons-stream (proc (stream-car s) (stream-map proc (stream-cdr s))))
      )
)
;Ill-formed special form: (cons-stream (proc ... ...))
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (stream-map proc s)
  (if (stream-null? s) the-empty-stream
      (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))
      )
)
;Value: stream-map

(define (stream-for-each proc s)
  (if (stream-null? s) 'done
      (begin (proc (stream-car s)) (stream-for-each proc (stream-cdr s)))
      )
)
;Value: stream-for-each

(define (display-stream s)
  (stream-for-each display-line s)
)
;Value: display-stream

(define (display-line x) (newline) (display x))
;Value: display-line

(pp delay)
;Syntactic keyword may not be used as an expression: #[keyword-value-item 12]
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(pp force)
(named-lambda (force promise)
  (guarantee-promise promise 'force)
  (let ((temp (system-pair-car promise)))
    (cond ((eq? temp #t) (system-pair-cdr promise))
          ((eq? temp 0)
           (let ((result ((system-pair-cdr promise))))
             (system-pair-set-cdr! promise result)
             (system-pair-set-car! promise #t)
             result))
          (else (force promise)))))
;Unspecified return value

(pp enumerate-interval)
;Unbound variable: enumerate-interval
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of enumerate-interval.
; (RESTART 6) => Define enumerate-interval to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): m
;Start debugger? (y or n): n

(pp cons-stream)
;Syntactic keyword may not be used as an expression: #[keyword-value-item 13]
;To continue, call RESTART with an option number:
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (stream-enumerate-interval low high)
  (if (> low high) the-empty-stream
      (cons-stream low (stream-enumerate-interval (+ low 1) high))
      )
)
;Value: stream-enumerate-interval

(stream-enumerate-interval 1 5)
;Value 14: (1 . #[promise 15])

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream) (stream-fileter pred (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))
	)
)
;Value: stream-filter

(define stream_list (stream-enumerate-interval 1 10))
;Value: stream_list

(stream_list)
;The object (1 . #[promise 16]) is not applicable.
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

stream_list
;Value 17: (1 . #[promise 16])

(car stream_list)
;Value: 1

(cdr stream_list)
;Value 16: #[promise 16]

(+ 1 (cdr stream_list))
;The object #[promise 16], passed as the second argument to integer-add, is not the correct type.
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify an argument to use in its place.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(force (cdr stream_list))
;Value 18: (2 . #[promise 19])

(+ 1 (force (cadr stream_list)))
;The object #[promise 16], passed as an argument to safe-car, is not a pair.
;To continue, call RESTART with an option number:
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

(force (cadr stream_list))
;The object #[promise 16], passed as an argument to safe-car, is not a pair.
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

(car (force (cdr stream_list)))
;Value: 2

