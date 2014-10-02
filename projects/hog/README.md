The Game of Hog
===============

## Basic Rules

* Two players
* Goal: reach 100 points
* Turn: choose up to 10 dice to roll
* Score: the sum of the dice, unless any die has 1, in which case only one point for the turn ("Pig out")

### Extra Rules

* *Free bacon*: a player can choose zero dice. Their score is one more than the largest digit in her opponent's current score. E.g., if player 1 has 42 points, player 0 gains 1 + max(4, 2) = 5 points.
* *Hog wild*: If the sum of both players' total scores is a multiple of seven, the current player rolls four-sides dice instead of six-sided.
* *Swine Swap*: If, at the end of a turn, one of the player's total score is exactly double the other's, then they players swap total scores.

### Simulator

* *Problem 1*: implement `roll_dice` function in hog.py which returns the number of points scored by rolling a fixed positive number of dice: either the sum of the dice or 1. To obtain a single outcome of a dice roll, call `dice()`. You should call this function _exactly_ `num_rolls` time in your implementation. The only rule you need to consider is _Pig out_.
* *Problem 2*:
