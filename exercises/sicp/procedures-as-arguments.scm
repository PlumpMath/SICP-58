;;;; From page 57

;; Add the integers between a and b
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b)))) 

;; Helper
(define (cube n)
  (* n n n))

;; Format
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

;; Example incrementer
(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))
