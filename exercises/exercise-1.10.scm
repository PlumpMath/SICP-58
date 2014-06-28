; Exercise 1.10 from SICP
; TODO: look up Ackermann's function and figure out what they want for the answer
; http://en.wikipedia.org/wiki/Ackermann_function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; 1,024
(A 2 4) ; 65,536
(A 3 3) ; 65,536

(define (f n) (A 0 n)) ; 2n
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n)) ; 5n^2 [?]
