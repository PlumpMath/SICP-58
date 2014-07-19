(define (product f a next b)
  (if (> a b)
    1
    (* (f a)
       (product f (next a) next b))))

(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (identity x) x) ; Allows returning the argument without running it (no op)

(define (factorial n)
  (product identity 1 inc n))
