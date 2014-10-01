;;;; 12 Days of Christmas
;;;; How many gifts in total?

;; Usage (count-days 12) should retunr 364 gifts
(define count-gifts
  (lambda (d) ; number of days
    (if (= d 1)
        1
        (+ d (count-gifts (- d 1)))))) 

(define count-gifts
  (lambda (num-days)
    (define lst (iota num-days 1)) ; Create range
    (if (null? lst)
	#t
	()))) ; not finished
	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; New attempt using a list ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create list with range 1 ... len
(define (create-lst len)
  (iota len 1)) 

(define count-gifts
  (lambda (num-days)
    (if (null? lst)
	#t
	(+ count-gifts (reduce + 0 (cdr lst)))))) 

;; Count all the gifts for Christmas
(count-gifts 12) 

;; Test
(= (count-gifts 12) 364) 


;;; Reference
;; Create a list from a range up to 12 starting at 1
(iota 12 1)

;; Sum a list
(reduce + 0 my-list)

;; Get all but first list item
(cdr my-list)
