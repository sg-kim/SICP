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

(pp stream-ref)
(named-lambda (stream-ref stream index)
  (let ((tail (stream-tail stream index)))
    (if (not (stream-pair? tail))
        (error:bad-range-argument index 'stream-ref))
    (car tail)))
;Unspecified return value

the-empty-stream
;Value: ()

(equal? () the-empty-stream)
;Value: #t


(define (stream-map proc s)
  (if (stream-null? s) the-empty-stream
      (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))
      )
)
;Value: stream-map

(define (stream-for-each proc s)
  (if (stream-null? s) 'done
      (begin
	(proc (stream-car s))
	(stream-for-each (stream-cdr s))
	)
      )
)
;Value: stream-for-each

(define (stream-enum-interval low high)
  (if (> low high) the-empty-stream
      (cons-stream low (stream-enum-interval (+ low 1) high))
      )
)
;Value: stream-enum-interval

(define stream_int (stream-enum-interval 0 5))
;Value: stream_int

stream_int
;Value 13: (0 . #[promise 14])

(stream-car stream_int)
;Value: 0

(stream-cdr stream_int)
;Value 15: (1 . #[promise 16])

(stream-ref stream_int 3)
;Value: 3

(stream-ref stream_int 0)
;Value: 0

(stream-ref stream_int 10)
;The object 4, passed as an argument to stream-tail, is not in the correct range.
;To continue, call RESTART with an option number:
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
  (if (map pred (stream-car stream)) 
      (cons-stream (car stream) (stream-filter pred (stream-cdr stream)))
      (stream-filter pred (stream-cdr stream))
      )
)

(define (stream-filter pred stream)
  (if (null? stream) the-empty-stream
      ;; map? stream-map?
      (if (map pred (stream-car stream))
	  (cons-stream (car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)
;Value: stream-filter

