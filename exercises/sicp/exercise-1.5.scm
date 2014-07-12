; Exercise 1.5 from SICP

; The code given is:
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; If it's applicative-order evaluation, the next line will run the infinitely recursive function first.
; If it's normal-order evaluation, it will return 0 without running (p).
; Scheme uses the former by default.
(test 0 (p))
