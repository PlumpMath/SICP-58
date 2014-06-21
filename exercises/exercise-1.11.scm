; Exercise 1.11 from SICP

; Formula:
; f(n = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3)

; Write a recursive version
(define (f n)
  (cond (< n 3) (n)
        (>= n 3) (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))


; Write an iterative version
