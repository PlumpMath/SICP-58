; Exercise 1.11 from SICP

; Formula:
; f(n) = n if n < 3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3

; Write a recursive version
; TODO: this is probably wrong, because it seems to return 3 for everything
(define (f n)
  (cond ((< n 3) n)
        (else (+
                   (f (- n 1))
                   (* 2 (f (- n 2)))
                   (* 3 (f (- n 3)))))))

; Write an iterative version

