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
	
Terms:

* _normal-order evaluation_: fully expand and then reduce 
* _applicative-order evaluation_: evaluate the arguments and then apply

Lisp uses applicative-order evaluation. More on normal-order evaluation in chapter 3.

### Conditionals

Format:

    (cond (<p1> <e1>)
    	  (<p2> <e2>)
	  	  (<pn> <en))

Each `(<pn> <en>)` is a _clause_ made up of a _predicate_ and a _consequent expression_. Example:

    (define (abs x)
    	    (cond ((> x 0) x)
	    		  ((= x 0) 0)
		     	  ((< x 0) (- x))))

Or:

	(define (abs x)
		(cond ((< x 0) (- x))
			  (else x)))

Or with `if`, which can only be used when there are two cases:

	(if <predicate> <consequent> <alternative>)

Example:

	(define (abs x)
		(if (< x 0)
			(- x)
			x))

### Logical Composition Operators

* `(and <e1> ... <en>)` -- evaluates e1 to en one at a time. If any are false it exits, otherwise returns the value of the last item.
* `(or <e1> ... <en>)` -- evaluates from left to right and if it finds a true, it stops and returns that item.
* `(not <e>)` -- evaluates as true when <e> is flase, otherwise false.

`and` and `or` are special forms, not procedures, because the subexpressions are not necessarily all evaluated.

JavaScript:

	if ((x > 5) && (x < 10)) {
	    // Do something
	}

Scheme:

	(and (> x 5) (< x 10) #t)

