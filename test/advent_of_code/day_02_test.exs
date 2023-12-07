defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @example "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 8
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 2286
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(2, 2023)
    result = part1(input)

    assert result == 2683
  end

  # @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(2, 2023)
    result = part2(input)

    assert result == 49710
  end
end
