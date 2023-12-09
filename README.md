# aoc-2023

## [Advent of Code 2023](https://adventofcode.com/2023) using Elixir!

### Completed Challenges

- Day 1: Trebuchet?!
- Day 2: Cube Conundrum
- Day 4: Scratchcards
- Day 5: If You Give A Seed A Fertilizer (part 1)
- Day 6: Wait For It
- Day 7: Camel Cards
- Day 9: Mirage Maintenance

### Repository Structure

There are 25 modules, 25 tests, and 50 mix tasks.

```text
|-- lib
  |-- advent_of_code
    |-- day_01.ex
  |-- mix/tasks
    |-- d01.p1.ex
    |-- d01.p2.ex
  |-- advent_of_code.ex
|-- test
  |-- advent_of_code
    |-- day_01_test.exs
  |-- test_helper.exs
```

### Solution Execution

- Get the result output for one part or one day with `mix d01.p1`
  - Show solution benchmark by passing the `-b` flag, `mix d01.p1 -b`
- Get the test results for all days with `mix test`

```text
> mix d01.p1
Part 1 Results: 55712
```

```text
> mix test
Finished in 0.4 seconds (0.00s async, 0.4s sync)
70 tests, 0 failures, 41 skipped
```

###  Automatic Input Retriever

This repository uses a module that will automatically get your inputs so you
don't have to mess with copy/pasting. Don't worry, it automatically caches your
inputs to your machine so you don't have to worry about slamming the Advent of
Code server. You will need to configure it with your cookie and make sure to
enable it. You can do this by creating a `config/secrets.exs` file containing
the following:

```elixir
import Config

config :advent_of_code, AdventOfCode.Input,
  allow_network?: true,
  session_cookie: "..." # yours will be longer
```

After which, it will retrieve your inputs using the module:

```elixir
AdventOfCode.Input.get!(1, 2023)
```
