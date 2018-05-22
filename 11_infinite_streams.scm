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

(define (prime-by-sieving)
  (let (
	(result (list 2))
	(next_num 3)
	)
    (define (divisible? n k)
      (if (null? k) false
	  (if (= (remainder n (car k)) 0) true (divisible? n (cdr k)))
	  )
      )
    (define (calc-primes n)
      (if (< next_num n)
	(begin
	  (if (not (divisible? next_num result)) (set! result (append result (cons next_num ()))))
	  (set! next_num (+ next_num 1))
	  ;;(display next_num)
	  (calc-primes n)
	  )
	result
	)
      )
    calc-primes
    )
)
;Value: prime-by-sieving

(define pbs (prime-by-sieving))
;Value: pbs

(pbs 10)
;Value 11: (2 3 5 7)

(pbs 20)
;Value 12: (2 3 5 7 11 13 17 19)

(pbs 100)
;Value 13: (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)

(define (stream-filter pred stream)
  (if (null? stream) the-empty-stream
      ;; map? stream-map?
      (if (pred (stream-car stream))
	  (cons-stream (car stream) (stream-filter pred (stream-cdr stream)))
	  (stream-filter pred (stream-cdr stream))
	  )
      )
)
;Value: stream-filter

(define (divisible? x y) (= (remainder x y) 0))
;Value: divisible?

(define (sieve stream)
  (cons-stream (stream-car stream)
	       (sieve (stream-filter
		       (lambda (x) (not (divisible? x (stream-car stream))))
		       (stream-cdr stream))
		      )
	       )
)
;Value: sieve

(define (stream-enum-interval low high)
  (if (> low high) the-empty-stream
      (cons-stream low (stream-enum-interval (+ low 1) high))
      )
)
;Value: stream-enum-interval

(define primes (sieve (stream-enum-interval 2 20)))
;Value: primes

primes
;Value 15: (2 . #[promise 16])

(stream-car primes)
;Value: 2

(stream-cdr primes)
;Value 17: (3 . #[promise 18])

(stream-cdr (stream-cdr primes))
;Value 19: (5 . #[promise 20])

(stream-ref primes 5)
;Value: 13

(define (integer-starting-from n)
  (cons-stream n (integer-starting-from (+ n 1)))
)
;Value: integer-starting-from

(define infinite_primes (sieve (integer-starting-from 2)))
;Value: infinite_primes

infinite_primes
;Value 25: (2 . #[promise 26])

(stream-cdr infinite_primes)
;Value 27: (3 . #[promise 28])

(stream-ref infinite_primes 5)
;Value: 13

