; Exercise 1.4 from SICP

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Returns the operator dynamically. Either the answer goes without saying or I'm missing something.
