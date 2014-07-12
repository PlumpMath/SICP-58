; Exercise 1.12 from SICP

; From Scheme wiki
(define (ptcell r e) 
  (cond ((= e 1) 1) 
        ((= e r) 1) 
        (else (+ (ptcell (- r 1) (- e 1)) 
                 (ptcell (- r 1) e))))) 

; Another version from the wiki
(define (pascal row col) 
  (cond ((or (< row col)  
             (< col 1)) 0 ) 
        ((or (= col 1) 
             (= col row)) 1) 
        (else (+ (pascal (- row 1) (- col 1)) 
                 (pascal (- row 1) col ))))) 
;; -----------------
;; Display a Pascal's Triangle

(define list-start (list 1))

; Take a list like '(1 3 3 1) and return '(0 1 3 3 1 0)
(define (pad-list-with-zeros lst)
  (define front-padded-lst (cons 0 lst)) ; pads beginning of list
  (append front-padded-lst '(0))) ; pads end of list

;; Recursive function to generate the triangle
(define (draw-triangle rows)
  (define (create-row lst)

    (cond ((<= rows 0) #f) ; exit if no more rows to draw
          (else 
            (set! current-row (pad-list-with-zeros lst)) ; pad it
            (display (+ (car current-row) (cadr current-row))); add the first two elements
            (set! rows (- rows 1))

            ; run again with the remainder of the list
            (create-row (cdr lst))))))

