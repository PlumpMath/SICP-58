; Exercise 1.2 from SICP
; I didn't check the correctness, but it evaluates to -37/150 in Scheme
; With a calculator: 74/5 * -60 = -888

(/
  (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) ; 74/5
  (* 3 (- 6 2) (- 2 7))) ; -60
