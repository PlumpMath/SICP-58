Composing Programs
==================

Notes from [ComposingPrograms.com](http://composingprograms.com/). The notes have moved [here](http://codeselfstudy.com/wiki/Composing_Programs).


=== Recursive Functions ===

Nice trick:

<syntaxhighlight lang="python">
# Get last digit
12345 % 10 # 5

# Get all but last digit
12345 // 10 # 1234
</syntaxhighlight>

Recursion example:

<syntaxhighlight lang="python">
def sum_digits(n):
    """Return the sum of the digits of positive integer n."""
        if n < 10:
            return n
        else:
            all_but_last, last = n // 10, n % 10
            return sum_digits(all_but_last) + last
</syntaxhighlight>

=== Iteration vs. Recursion ===

Factorial examples in Python:

<syntaxhighlight lang="python">
def fact_iter(n):
    total, k = 1, 1
    while k <= n:
        total, k = total * k, k + 1
    return total

def fact(n):
    if n == 1:
        return 1
    else:
        return n * fact(n-1)
</syntaxhighlight>

=== Mutual Recursion ===

<syntaxhighlight lang="python">
def is_even(n):
    if n == 0:
        return True
    else:
        return is_odd(n-1)

def is_odd(n):
    if n == 0:
        return False
    else:
        return is_even(n-1)

result = is_even(4)
</syntaxhighlight>

Or:

<syntaxhighlight lang="python">
def is_even(n):
    if n == 0:
        return True
    else:
        if (n-1) == 0:
            return False
        else:
            return is_even((n-1)-1)
</syntaxhighlight>

=== Printing Recursion ===

<syntaxhighlight lang="python">
def cascade(n):
    if n < 10:
        print(n)
    else:
        print(n)
        cascade(n//10)
        print(n)
</syntaxhighlight>


