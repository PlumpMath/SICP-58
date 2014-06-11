; Exercise 1.3 in SICP

; Accept three numbers and return the larger two
(define (sum-of-squares-largest-two-of-three x y z)
  (cond ((or (< x y) (< x z)) (+ (square y) (square z)))
        ((or (< y x) (< y z)) (+ (square x) (square z)))
        (else (+ (square x) (square y)))))
