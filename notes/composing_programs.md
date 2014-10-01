Composing Programs
==================

# Python

* Use Python 3 -- start it with `$ python3` on Ubuntu.

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
from math import sqrt
from operator import add, sub, mul
sqrt(256)
add(14, 28)
sub(100, mul(7, add(8, 4)))
```


