SICP
====

## Resources

* [SICP in HTML Format](https://sarabander.github.io/sicp/)
* [YouTube Videos](http://www.youtube.com/results?search_query=sicp)
* [UC Berkeley Class Videos](http://youtu.be/zmYqShvVDh4)
* [EdX 'Edge' Course](https://edge.edx.org/courses/UCBerkeleyX/CS61AS/2014_Spring/about)
* [A Syllabus](http://www-inst.eecs.berkeley.edu/~cs61a/sp14/)

See also:

* [Quick summary of Scheme](http://classes.soe.ucsc.edu/cmps112/Spring03/languages/scheme/SchemeTutorialA.html)
* [Simply Scheme](http://www.cs.berkeley.edu/~bh/ss-toc2.html)
* [Cheatsheet](http://www.cefns.nau.edu/~edo/Classes/CS396_WWW/Misc_docs/Scheme%20Tutorial.html)
* [Cheatsheet](http://www.cefns.nau.edu/~edo/Classes/CS396_WWW/Misc_docs/schemeCheatsheet.pdf) -- I built the Anki deck from this one
* [Big reference at GNU.org](http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/)

## Chapter 1

Some functions:

    (first '(here is a sentence)) ; returns "here"
    
    (last '(here is a sentence)) ; returns "sentence"

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

---

### 1.2.3 Orders of Growth


### Higher Order Procedures

### Constructing Procedures Using `Lambda`

Example:

    (lambda (X) (+ x 4))
	
This:

    (define (a x) (+ x 4))

is the same as this:

    (define a (lambda (x) (+ x 4)))

Another example:

    ((lambda (x y z) (+ x y (square z))) 1 2 3)

### `let` for Local Variables

The general form of `let` is:

    (let ((<var 1> <exp 1>)
          (<var 2> <exp 2>)
          ...
          (<var n> <exp n>))
      <body>)

In other words:

    let <var 1> have the value <exp 1> and
        <var 2> have the value <exp 2> and
        ...
        <var n> have the value <exp n>
      in <body>

"A let expression is simply syntactic sugar for the underlying lambda application" that looks like this:

    ((lambda (<var 1> ... <var n>)
        <body>)
        <exp 1>
        ...
        <exp n>)

Watch out for situations like this where the outer variable is used because it isn't in the <body> yet:

    (define x 2)
    (let ((x 3) ; This local variable gets used in the <body>
          (y (+ x 2))) ; x is still 2 on this line, so y=4
      (* x y)) ; 3*4=12

### `(define (<name> <term> a <next> b) ...)`

See also: http://stackoverflow.com/questions/24038769/dont-understand-scheme-procedure-in-sicp

    ; The basic pattern:
    (define (<name> <term> a <next> b)
      (if (> a b)
          0
          (+ (<term> a)
         (<name> <term> (<next> a) <next> b))))

* <name> is the name of the procedure (e.g., "sum")
* <term> is the procedure that is applied to each item in the series. It can be called "term" or "identity" or whatever
* <next> is the incrementer

Another example: `(sum identity 1 add1 10)`

Here's a working example:

    (define (sum term a next b)
      (if (> a b)
          0
          (+ (term a)
         (sum term (next a) next b)))) 

    ;; term is a function
    ;; next is the function that gets to the next term, e.g., `inc` 

    (define (cube a)
      (* a a a)) 
    (define (inc n) (+ n 1)) 
    (define (sum-cubes a b)
      (sum cube a inc b)) 

For more details, see exercise-1.31.scm in the `exercises` directory.

## Chapter 2

Summarizing Chapter 1: the focus was on "building abstractions by combining procedures to form compound procedures."

`add-rat` should keep track of numerator and denominators as a pair (compound data object).

### Key ideas:

* **closure**: the glue we use for combining data objects should allow us to combine not only primitive data objects, but compound data objects as well.
* **conventional interfaces**: compound data objects can serve as conventional interfaces for combining program modules in mix-and-match ways
* **symbolic expressions**: data whose elementary parts can be arbitrary symbols rather than only numbers... there are many ways in which a given data structure can be represented in terms of simpler objects, and the choice of representation can have significant impact on the time and space requirements of processes that manipulate the data.
* **generic operations**: they handle many different types of data.
* **data directed programming**: a technique that allows individual data representations to be designed in isolation and then combined _additively_ (i.e., without modification)

### Data Abstraction

Make no assumptions about the data that are not strictly necessary for performing the task at hand.

* **selectors**
* **constructors**

Tools:

* `cons`
* `car`
* `cdr`

Example:

    (define x (cons 1 2))
    (define y (cons 3 4))
    (define z (cons x y))
    (car (car z)) ; 1
    (car (cdr z)) ; 3

