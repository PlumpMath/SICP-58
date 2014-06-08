# Functional Programming Video Lectures

From UC Berkeley.

## [Functional Programming 1](http://youtu.be/zmYqShvVDh4)

* An expression as data: `'(+ 2 3)` ; returns "(+ 2 3)", not 5.
* A "sentence" is a sequence of words: `'(this is some data)`

Informally, argument can refer to any of these three things:

* Arguments
* Formal parameters -- the name for the name of an argument. When you're defining the function you say what the formal parameters are.
* Actual argument expression -- the `(+ 2 3)` in `(square (+ 2 3))`.

An example formal parameter is the first `x` here:

    (define (square x)
        (* x x))

### Function vs. Procedure

These are the same _functions_ but different _procedures_:

    f(x)=2(x+3)
    g(x)=2x+6

"Inside a computer there are only procedures."

## [Functional Programming 2](http://youtu.be/HFxGVf3KAto)
