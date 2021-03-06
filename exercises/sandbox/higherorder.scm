;;;; From the higher-order procedures section in 1.3

;; (define (sum-integers a b)
;;   (if (> a b)
;;       0
;;       (+ a (sum-integers (+ a 1) b)))) 

;; (define (sum-cubes a b)
;;   (if (> a b)
;;       0
;;       (+ (cube a)
;; 	 (sum-cubes (+ a 1) b))))

;; (define (pi-sum a b)
;;   (if (> a b)
;;       0
;;       (+ (/ 1.0 (* a (+ a 2)))
;; 	 (pi-sum (+ a 4) b))))

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
