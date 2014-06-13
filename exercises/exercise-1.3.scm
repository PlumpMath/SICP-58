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
; Version 3 -- took some research to get it to work.

; Accept three numbers and return the larger two as a list
(define (larger-two-of-three x y z)
  (cond ((and (< x y) (< x z)) (list y z))
        ((and (< y x) (< y z)) (list x z))
        (else (list x y))))

; Take a list and sum the squares
(define (sum-of-squares lst)
  (reduce + 0 (map (lambda (x) (square x)) lst)))

; Run it with arguments: 1, 2, and 3
(sum-of-squares (larger-two-of-three 1 2 3))

; The function also works if you pass in a list of any size
(sum-of-squares '(1 2 3 4 5))

; TODO: figure out why something like this wouldn't work
; Is lambda necessary?
; (reduce + 0 (map (square) lst)))
;
; TODO: make a larger-x-of-list function that could return largest 2 or 10 of a list

