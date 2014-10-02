Composing Programs
==================

# Python

* Use Python 3. Start it with `$ python3`.

Basic things that are introduced:

```python
from urllib.request import urlopen
shakespeare = urlopen('http://composingprograms.com/shakespeare.txt')
words = set(shakespear.read().decode().split())

# Create a `set` of words that can be reversed to create other words in the doc
{w for w in words if len(w) == 6 and w[::-1] in words}
```

They introduce some basic math functions:

* `pow(2, 10)`
* `max(21, 2, 3, 75)`
* `min(21, 2, 3, 75)`
* `max(min(1, -2), min(pow(3, 5), -4))`

Other math:

```python
from math import sqrt, pi
from operator import add, sub, mul, truediv, floordiv
sqrt(256)
add(14, 28)
sub(100, mul(7, add(8, 4)))
pi * 71 / 223
5 / 4 # 1.25
5 // 4 # =1 it rounds down to an integer
truediv(5, 4) # same as /
floordiv(5, 4) # same as //
```

Multiple assignment:

```python
x, y, z = 1, 2, 3
```

Things to the right of the `=` are evaluated first, so this works for switching values:

```python
x, y = y, x
```

## Expression Trees

See the diagrams in section 1.2.5

## Pure vs. Non-Pure Functions

Watch out:

```python
two = print(2)
print(two) # >>> None
```
(`print` returns None.)

```python
# Pure
def square(x):
    return mul(x, x)

# Not pure
def print_square(x):
    print(square(x)) # Side effects, returns None
```

## Defining Functions

    def <name>(<formal parameters>):
        return <return expression>

Examples:

```python
def square(x):
    return mul(x, x)

def sum_squares(x, y):
    return add(square(s), square(y))
```

Built-in functions don't have formal paramenter names. E.g., `mul(...)`.

## Frames and Execution Model

See section 1.3 and [the official docs](https://docs.python.org/3.3/reference/executionmodel.html). Basic scope info.

## Code Style

See [PEP 8](http://legacy.python.org/dev/peps/pep-0008/).

## Designing Functions

Standard stuff:

* Don't Repeat Yourself (DRY)
* Functions should have exactly one job
* Split multiple jobs into multiple functions

## Docstrings

```python
def pressure(v, t, n):
    """Computer the pressure in pascals of an ideal gas.

    Applies the ideal gas law: http://en.wikipedia.org/wiki/Ideal_gas_law

    v -- volume of gas, in cubic meters
    t -- absolute temperature in degrees kelvin
    n -- particles of gas
    """
    k = 1.38e-23 # Boltzmann's constant
    return n * k * t / v
```

Then you can get help with `help(pressure)`.

## Default Argument Values

Example:

```python
def pressure(v, t, n=6.022e23):
    pass
```

