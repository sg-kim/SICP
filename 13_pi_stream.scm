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

(define (alt-odd-stream)
  (let (
	(new_num (lambda (x) (if (< x 0) (* (- x 2) -1) (* (+ x 2) -1))))
	)
    (define (alt-odd x)
      (cons-stream x (alt-odd (new_num x)))
      )
    (alt-odd 1)
    )
)
;Value: alt-odd-stream

(define alt_odd_stream (alt-odd-stream))
;Value: alt_odd_stream

(stream-ref alt_odd_stream 0)
(stream-ref alt_odd_stream 1)
(stream-ref alt_odd_stream 2)
(stream-ref alt_odd_stream 3)
;Value: 1

;Value: -3

;Value: 5

;Value: -7

(define (pi-stream)
  (define (accumulate-inverse-stream init stream)
    (cons-stream init (accumulate-inverse-stream (+ init (/ 1.0 (stream-car stream))) (stream-cdr stream)))
    )
  (accumulate-inverse-stream 0 alt_odd_stream)
)
;Value: pi-stream

(define pi_stream (pi-stream))
;Value: pi_stream

(stream-ref pi_stream 0)
(stream-ref pi_stream 1)
(stream-ref pi_stream 2)
(stream-ref pi_stream 3)
(stream-ref pi_stream 4)
;Value: 0

;Value: 1.

;Value: .6666666666666667

;Value: .8666666666666667

;Value: .7238095238095239

(define (stream-map proc stream)
  (if (null? stream) ()
      (cons-stream (proc (stream-car stream)) (stream-map proc (stream-cdr stream)))
      )
)
;Value: stream-map

(define (pi-stream)
  (define (accumulate-inverse-stream init stream)
    (cons-stream init (accumulate-inverse-stream (+ init (/ 1.0 (stream-car stream))) (stream-cdr stream)))
    )
  (stream-map (lambda (x) (* x 4)) (accumulate-inverse-stream 0 alt_odd_stream))
)
;Value: pi-stream

(define pi_stream (pi-stream))
;Value: pi_stream

(stream-ref pi_stream 0)
(stream-ref pi_stream 1)
(stream-ref pi_stream 2)
(stream-ref pi_stream 3)
(stream-ref pi_stream 4)
;Value: 0

;Value: 4.

;Value: 2.666666666666667

;Value: 3.466666666666667

;Value: 2.8952380952380956

(stream-ref pi_stream 10)
;Value: 3.0418396189294032

(stream-ref pi_stream 20)
;Value: 3.09162380666784

(stream-ref pi_stream 100)
;Value: 3.1315929035585537
