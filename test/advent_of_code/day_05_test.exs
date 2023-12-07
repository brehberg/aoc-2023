defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  @example "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 35
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 46
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(5, 2023)
    result = part1(input)

    assert result == 486_613_012
  end

  @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(5, 2023)
    result = part2(input)

    assert result
  end
end
