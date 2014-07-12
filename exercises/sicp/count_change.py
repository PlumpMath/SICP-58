# A quick attempt to translate the count coins script directly from Scheme to Python.
# It's just an experiment to better understand how it works, since Scheme is still difficult to read for me.
# Python can't handle the recursion depth, and there might be other errors. I haven't used Python for many months.
# I'll look at it again later -- at least it's easier to understand from a glance.

import sys

# Increase recursion limit, but it just causes an error:
# Segmentation fault (core dumped) -- Python crashed
sys.setrecursionlimit(10000000)

def count_change(amount):
    return cc(amount, 5)

def cc(amount, kinds_of_coins):
    if amount == 0:
        return 1
    elif amount < 0 or kinds_of_coins == 0:
        return 0
    else:
        kinds_of_coins_minus_one = kinds_of_coins - 1
        return cc(amount, kinds_of_coins_minus_one) + cc(amount, first_denomination(kinds_of_coins) - kinds_of_coins)

def first_denomination(kinds_of_coins):
    if kinds_of_coins == 1:
        return 1
    if kinds_of_coins == 2:
        return 5
    if kinds_of_coins == 3:
        return 10
    if kinds_of_coins == 4:
        return 25
    if kinds_of_coins == 5:
        return 50

# Even changing this to 10 doesn't help
count_change(100)

