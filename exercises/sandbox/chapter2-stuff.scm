;; Random stuff from Chapter 2

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
	  ((= m 1) y)
	  (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch) ; returns it as a function?

(define (car z) (z 0)) 
(define (cdr z) (z 1)) 


