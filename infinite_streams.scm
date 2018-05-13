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

(define (test)
  (define (plus a b)
    (+ a b)
    )
  (define (minus a b)
    (- a b)
    )
  (define (dispatch op)
    (cond
     ((equal? op 'plus) plus)
     ((equal? op 'minus) minus)
     (else (error "undefined operation -" op))
     )
    )
  dispatch
)
;Value: test

(define t1 test)
;Value: t1

(pp t1)
(named-lambda (test)
  (define (plus a b)
    (+ a b))
  (define (minus a b)
    (- a b))
  (define (dispatch op)
    (cond ((equal? op 'plus) plus)
          ((equal? op 'minus) minus)
          (else (error "undefined operation -" op))))
  dispatch)
;Unspecified return value

(t1 'plus 1 2)
;The procedure #[compound-procedure 12 test] has been called with 3 arguments; it requires exactly 0 arguments.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(t1 'plus 1 2)
;The procedure #[compound-procedure 12 test] has been called with 3 arguments; it requires exactly 0 arguments.
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...

(define (test)
  (define (plus a b)
    (+ a b)
    )
  (define (minus a b)
    (- a b)
    )
  (define (dispatch op)
    (cond
     ((equal? op 'plus) plus)
     ((equal? op 'minus) minus)
     (else (error "undefined operation -" op))
     )
    )
  dispatch
)

(pp t1)
(named-lambda (test)
  (define (plus a b)
    (+ a b))
  (define (minus a b)
    (- a b))
  (define (dispatch op)
    (cond ((equal? op 'plus) plus)
          ((equal? op 'minus) minus)
          (else (error "undefined operation -" op))))
  dispatch)
;Unspecified return value

(define (test)
  (define (plus a b)
    (+ a b)
    )
  (define (minus a b)
    (- a b)
    )
  (define (dispatch op . args)
    (cond
     ((equal? op 'plus) plus)
     ((equal? op 'minus) minus)
     (else (error "undefined operation -" op))
     )
    )
  dispatch
)
;Value: test

(define t1 test)
;Value: t1

(pp t1)
(named-lambda (test)
  (define (plus a b)
    (+ a b))
  (define (minus a b)
    (- a b))
  (define (dispatch op . args)
    (cond ((equal? op 'plus) plus)
          ((equal? op 'minus) minus)
          (else (error "undefined operation -" op))))
  dispatch)
;Unspecified return value

(t1 'plus 1 2)
;The procedure #[compound-procedure 16 test] has been called with 3 arguments; it requires exactly 0 arguments.
;To continue, call RESTART with an option number:
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define (test . args)
  (define (plus a b)
    (+ a b)
    )
  (define (minus a b)
    (- a b)
    )
  (define (dispatch op)
    (cond
     ((equal? op 'plus) plus)
     ((equal? op 'minus) minus)
     (else (error "undefined operation -" op))
     )
    )
  dispatch
)
;Value: test

(define t1 test)
;Value: t1

(t1 'plus 1 2)
;Value 17: #[compound-procedure 17 dispatch]

(define (test)
  (define (plus a b)
    (+ a b)
    )
  (define (minus a b)
    (- a b)
    )
  (define (dispatch op)
    (cond
     ((equal? op 'plus) plus)
     ((equal? op 'minus) minus)
     (else (error "undefined operation -" op))
     )
    )
  dispatch
)
;Value: test

(define t1 (test))
;Value: t1

(pp t1)
(named-lambda (dispatch op)
  (cond ((equal? op 'plus) plus)
        ((equal? op 'minus) minus)
        (else (error "undefined operation -" op))))
;Unspecified return value

(define t1 test)
;Value: t1

(pp t1)
(named-lambda (test)
  (define (plus a b)
    (+ a b))
  (define (minus a b)
    (- a b))
  (define (dispatch op)
    (cond ((equal? op 'plus) plus)
          ((equal? op 'minus) minus)
          (else (error "undefined operation -" op))))
  dispatch)
;Unspecified return value

(define t1 (test))
;Value: t1

(pp t1)
(named-lambda (dispatch op)
  (cond ((equal? op 'plus) plus)
        ((equal? op 'minus) minus)
        (else (error "undefined operation -" op))))
;Unspecified return value

(t1 'plus 1 2)

((t1 'plus) 1 2)
;Value: 3



;The procedure #[compound-procedure 18 dispatch] has been called with 3 arguments; it requires exactly 1 argument.
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n


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
	  (if (not (divisible? next_num result)) (set! result (list result (cons next_num ()))))
	  (set! next_num (+ next_num 1))
	  (display next_num)
	  (prime-by-sieving n)
	  )
	(result)
	)
      )
    )
  calc-primes
)
;Value: prime-by-sieving

(define p1 (prime-by-sieving))
;Unbound variable: calc-primes
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of calc-primes.
; (RESTART 6) => Define calc-primes to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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
	  (if (not (divisible? next_num result)) (set! result (list result (cons next_num ()))))
	  (set! next_num (+ next_num 1))
	  (display next_num)
	  (prime-by-sieving n)
	  )
	(result)
	)
      )
    calc-primes
    )
)
;Value: prime-by-sieving

(define p1 (calc-primes))
;Unbound variable: calc-primes
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a value to use instead of calc-primes.
; (RESTART 7) => Define calc-primes to a given value.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define p1 (prime-by-sieving))
;Value: p1

(pp p1)
(named-lambda (calc-primes n)
  (if (< next_num n)
      (begin (if (not (divisible? next_num result)) (set! result (list result (cons next_num '()))))
             (set! next_num (+ next_num 1))
             (display next_num)
             (prime-by-sieving n))
      (result)))
;Unspecified return value

(p1 10)
4
;The procedure #[compound-procedure 19 prime-by-sieving] has been called with 1 argument; it requires exactly 0 arguments.
;To continue, call RESTART with an option number:
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

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
	  (if (not (divisible? next_num result)) (set! result (list result (cons next_num ()))))
	  (set! next_num (+ next_num 1))
	  ;;(display next_num)
	  (calc-primes n)
	  )
	(result)
	)
      )
    calc-primes
    )
)
;Value: prime-by-sieving

(define p1 (prime-by-sieving))
;Value: p1

(p1 10)
;The object (2), passed as the second argument to integer-remainder, is not the correct type.
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
;Start debugger? (y or n): y
;Starting debugger...

(list 2 (cons 3 ()))
;Value 23: (2 (3))

(list 2 (list 3))
;Value 24: (2 (3))

(cons (list 2) 3)
;Value 25: ((2) . 3)

(cons 2 ())
;Value 26: (2)

(cons 2 (cons 3 ()))
;Value 27: (2 3)

(list 2 (cons 3 ()))
;Value 28: (2 (3))

(list 2 3)
;Value 29: (2 3)

(cdr (list 2 3 4))
;Value 30: (3 4)

(car (list 2 (cons 3 ())))
;Value: 2

(pp set-last!)
;Unbound variable: set-last!
;To continue, call RESTART with an option number:
; (RESTART 11) => Specify a value to use instead of set-last!.
; (RESTART 10) => Define set-last! to a given value.
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

(pp append)
(named-lambda (append . lists)
  (%append lists))
;Unspecified return value

(append (list 2 3) 4)
;Value 31: (2 3 . 4)

(append (list 2 3) (cons 4 ()))
;Value 32: (2 3 4)


(define (prime-by-sieving)
  (let (
	(result (list 2))
	(next_num 3)
	)
    (define (a
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
	(result)
	)
      )
    calc-primes
    )
)
;Ill-formed special form: (define (a ... ... calc-primes))
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

(define (prime-by-sieving)
  (let (
	(result (list 2))
	(next_num 3)
	)
    (define (a
    (define (divisible? n k)
      (if (null? k) false
	  (if (= (remainder n (car k)) 0) true (divisible? n (cdr k)))
	  )
      )
    (define (calc-primes n)
      (if (< next_num n)
	(begin
	  (if (not (divisible? next_num result)) (append result (cons next_num ())))
	  (set! next_num (+ next_num 1))
	  ;;(display next_num)
	  (calc-primes n)
	  )
	(result)
	)
      )
    calc-primes
    )
)
;Ill-formed special form: (define (a ... ... calc-primes))
;To continue, call RESTART with an option number:
; (RESTART 11) => Return to read-eval-print level 11.
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

(define (prime-by-sieving)
  (let (
	(result (list 2))
	(next_num 3)
	)
    (define (a
    (define (divisible? n k)
      (if (null? k) false
	  (if (= (remainder n (car k)) 0) true (divisible? n (cdr k)))
	  )
      )
    (define (calc-primes n)
      (if (< next_num n)
	(begin
	  (if (not (divisible? next_num result)) (append result (cons next_num ())))
	  (set! next_num (+ next_num 1))
	  ;;(display next_num)
	  (calc-primes n)
	  )
	(result)
	)
      )
    calc-primes
    )
)
;Ill-formed special form: (define (a ... ... calc-primes))
;To continue, call RESTART with an option number:
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
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
;Start debugger? (y or n): y
;Starting debugger...

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
	(result)
	)
      )
    calc-primes
    )
)
;Value: prime-by-sieving

(define p1 (prime-by-sieving))
;Value: p1

(pp p1)
(named-lambda (calc-primes n)
  (if (< next_num n)
      (begin (if (not (divisible? next_num result)) (set! result (append result (cons next_num '()))))
             (set! next_num (+ next_num 1))
             (calc-primes n))
      (result)))
;Unspecified return value

(p1 10)
;The object (2 3 5 7) is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 14) => Specify a procedure to use in its place.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
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

(define p1 (prime-by-sieving))
;Value: p1

(p1 10)
;Value 46: (2 3 5 7)

(p1 20)
;Value 47: (2 3 5 7 11 13 17 19)

(p1 100)
;Value 48: (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)

(p1 1000)
;Value 49: (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997)

(p1 20)
;Value 49: (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997)

(pp cons-stream)
;Syntactic keyword may not be used as an expression: #[keyword-value-item 50]
;To continue, call RESTART with an option number:
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
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

(cons-stream 2 3)
;Value 51: (2 . #[promise 52])

(cdr (cons-stream 2 3))
;Value 53: #[promise 53]

(force (cdr (cons-stream 2 3)))
;Value: 3




