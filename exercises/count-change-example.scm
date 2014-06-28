; Example: count-change from SICP, pp. 40-41
; 
; It's a "tree-recursive process with redundancies similar to those in our first implementation of fib." It is not efficient in this form.

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)                            ; If 0 return 1
        ((or (< amount 0) (= kinds-of-coins 0)) 0)  ; If nothing to do return 0
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
