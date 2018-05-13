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

(define (stream-map proc . argstreams)
  (if (null? (car argstreams)) ()
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map (cons proc (map stream-cdr argstreams)))
       )
      )
)
;Value: stream-map

(define (pi_stream)

  (define (interleaved_sign_odd_num k)
    (if (> k 0) (* -1 (+ k 2)) (* -1 (- k 2)))
    )

  (define (stream_interleaved_sign_odd_num n)
    (cons-stream n (stream_interleaved_sign_odd_num (interleaved_sign_odd_num n)))
    )

  (define (stream-accumulation sum stream)
    (begin
      (set! sum (+ sum (stream-car stream)))
      (cons-stream sum (stream-accumulation sum (stream-cdr stream)))
      )
    )

  (define stream_odd_int (stream_interleaved_sign_odd_num 1))

  (define stream_odd_real (stream-map (lambda (x) (/ 1.0 x)) stream_odd_int))

  (define quarter_pi_stream (stream-accumulation 0 stream_odd_real))

  (stream-map (lambda (x) (* x 4)) quarter_pi_stream)
)
;Value: pi_stream

(pi_stream)
;Value 11: (4. . #[promise 12])

(stream_ref (pi_stream) 10)
;Unbound variable: stream_ref
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of stream_ref.
; (RESTART 2) => Define stream_ref to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(stream-ref (pi_stream) 10)
;Value: 3.232315809405594


















