;;;; Exercise 1.32 from SICP

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

;; ; The basic pattern
;; (define (<name> a b)
;;   (if (> a b)
;;       0
;;       (+ (<term> a)
;; 	 (<name> (<next> a) b))))

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
