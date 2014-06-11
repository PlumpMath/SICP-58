; Exercise 1.3 in SICP

; -----------------------------------------------
; Version 1

; Accept three numbers and return the some of squares
; of the larger two
(define (sum-of-squares-largest-two-of-three x y z)
  (cond ((and (< x y) (< x z)) (+ (square y) (square z))) ; x < both
        ((and (< y x) (< y z)) (+ (square x) (square z))) ; y < both
        (else (+ (square x) (square y)))))

; -----------------------------------------------
; Version 2

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-largest-two-of-three x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

; -----------------------------------------------
; Version 3 doesn't work. See error message below.

; Accept three numbers and return the larger two
(define (larger-two-of-three x y z)
  (cond ((and (< x y) (< x z)) '(y z))
        ((and (< y x) (< y z)) '(x z))
        (else '(x y))))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

; Run it with arguments: 1, 2, and 3
(sum-of-squares (larger-two-of-three 1 2 3))

; How do I get around this problem?
;The procedure #[compound-procedure 11 sum-of-squares] has been called with 1 argument; it requires exactly 2 arguments.

