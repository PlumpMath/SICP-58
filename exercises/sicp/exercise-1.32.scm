;;;; Exercise 1.32 from SICP

;;; The previous exercises are special cases of a more general notion called accumulate:
;;; (accumulate combiner null-balue term a next b)

;; Trying to understand what's in the answer wiki
;; It looks like a reduce function

;; "term" is the other function that will be using the function?
;; This is from a previous exercise: 
;; (define (inc n) (+ n 1)) 
;; (define (sum-cubes a b)
;;   (sum cube a inc b)) ; "cube" is the "term" in this one

(define (accumulate combiner null-value term a next b)
  (if (> a b ) null-value ; This creates the base case
      (combiner (term a) (accumulate combiner null-value term (next a ) next b))))

;; Why is it "term"? What do you pass to (sum)?
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
