; Exercise 1.3 in SICP

; Accept three numbers and return the larger two
(define (sum-of-squares-largest-two-of-three x y z)
  (cond ((or (< x y) (< x z)) (sum-of-squares y z))
        ((or (< y x) (< y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(define (sum-of-squares x y)
  (+ (square x) (square y)))
