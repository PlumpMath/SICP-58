;;;; Exercise 1.31 from SICP

;;; I used the answers wiki to try to understand the proper way to do this

;; Definitions:
;; (product term a next b)
;; "product" is the function that does something to the range
;; a and b are the low and high numbers in the range
;; "next" is the incrementer. In this case ++.
;; "term

(define (identity x) x) 

(define (next n) (+ n 1))

(define (product term a next b)
  (if (> a b)
      1 ; We're multiplying, so use 1 rather than zero
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product identity 1 next n))

;;; See also:
;; http://stackoverflow.com/questions/24038769/dont-understand-scheme-procedure-in-sicp

;; ; The basic pattern:
;; (define (<name> <term> a <next> b)
;;   (if (> a b)
;;       0
;;       (+ (<term> a)
;; 	 (<name> <term> (<next> a) <next> b))))
;; <name> is the name of the procedure (e.g., "sum")
;; <term> is the procedure that is applied to each item in the series. It can be called "term" or "identity" or whatever
;; <next> is the incrementer
;; Another example: (sum identity 1 add1 10)

; Becomes:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b)))) 
;; term is a function
;; next is the function that gets to the next term, e.g., `inc` 

(define (inc n) (+ n 1)) 
(define (sum-cubes a b)
  (sum cube a inc b)) 

(define (cube a)
  (* a a a)) 

;; "With the aid of an identity procedure to compute the term, we can define `sum-integers` in term of `sum`."

(define (identity x) x) 
(define (sum-integers a b)
  (sum identity a inc b))

;;;; Another attempt

(define (product f a next b)
  (if (> a b)
    1
    (* (f a)
       (product f (next a) next b))))

(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (identity x) x) ; Allows returning the argument without running it (no op)

(define (factorial n)
  (product identity 0 inc n))
