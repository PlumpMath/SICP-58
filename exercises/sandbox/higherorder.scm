;;;; From the higher-order procedures section in 1.3

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b)))) 

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
	 (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
	 (pi-sum (+ a 4) b))))

; The basic pattern
(define (<name> a b)
  (if (> a b)
      0
      (+ (<term> a)
	 (<name> (<next> a) b))))
