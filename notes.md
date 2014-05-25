SICP
====

## Chapter 1

Define variables with `define`:

	(define pi 3.1415926535)

Evaluating Combinations

1. Evaluate the subexpressions of the combination.
2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).

This example applies evaluation to four combinations:

	(* (+ 2 (* 4 6))
		(+ 3 5 7))

They form a tree. From bottom to top:

* (* 4 6) ; 24
* (+ 2 24) ; 26
* (+ 3 5 7) ; 15
* (* 26 15) ; 390

Term: tree accumulation (TODO: what is that?)

The evaluation rule doesn't handle definitions. (define x 3) isn't a combination. It's an exception called a "special form".

### Compound Procedures

Compound procedure form:

	(define (<name> <formal parameters>) <body>)

* `<name>` is a symbol associated with the procedure
* `<formal parameters>` are names for the arguments
* `<body>` yields the value

Example:

	(define (square x) (* x x))

	; Returns 4
	(square 2)

	(define (sum-of-squares x y)
		(+ (square x) (square y)))

	; Returns 25
	(sum-of-squares 3 4)

	(define (f a)
		(sum-of-squares (+ a 1) (* a 2)))

	; Returns 136
	(f 5)
	
