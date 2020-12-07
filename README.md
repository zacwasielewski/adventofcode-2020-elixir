# Advent of Code 2020 solved with Elixir

[Advent of Code](https://adventofcode.com/) is back! Last year, I took a stab at it using [Elixir](https://elixir-lang.org/), but only had the time and resources to solve a handful of the problems. This year I’ll try again.

I’ve used Elixir only a few times. The language’s bizarre elegance intrigues me; its lack of common programming features like `for` and `while` loops is offset by pattern-matching, pipelines, and immutability. I haven’t written enough Elixir code to become comfortable with these strange new tools, but they’re foreign enough to be interesting—and who knows what [unknown unknowns](https://en.wikipedia.org/wiki/There_are_known_knowns) are lurking beyond my horizon?

Anyway, I’m hoping that a month of occasional floundering with Elixir will expand my mental framework of what programming actually means (like Ruby, Clojure, and functional programming did). So, onward to the code:

## Instructions

Assuming that Elixir is [installed on your system](https://elixir-lang.org/install.html):

1. Solving the day’s problem:

   `elixir day-01.exs`

2. Running tests:

   `elixir -r day-01.exs day-01-test.exs`

## What I Learned

### Day 1:

**There's no shame in stealing (code)!** I implemented Part 1 using a simple, efficient algorithm that runs in [O(n) time](https://justin.abrah.ms/computer-science/big-o-notation-explained.html). But as usual, Part 2 switched things up just enough that my “simple” solution no longer felt like a good fit. So I threw caution/efficiency to the wind and just used [combinations](https://www.mathsisfun.com/combinatorics/combinations-permutations.html), as I should have done in Part 1 instead of getting sidetracked by premature optimization. It turns out that Elixir doesn't [natively support permutations and combinations like my good friend Ruby](https://apidock.com/ruby/Array/permutation), but if [someone else has written that code already](https://www.adiiyengar.com/blog/20190608/elixir-combinations), which is essentially just an implementation detail, why should I reinvent the wheel?
