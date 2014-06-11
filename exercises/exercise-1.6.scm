; Exercise 1.6 from SICP

; The given new-if function
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Other required square root code
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

; Alyssa's square root program
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; Answer: endless recurion

; I couldn't figure out why, so I looked up the answer:
; http://community.schemewiki.org/?sicp-ex-1.6
; (new-if uses applicative-order evaluation rather than normal-order evaluation, causing endless recursion)

