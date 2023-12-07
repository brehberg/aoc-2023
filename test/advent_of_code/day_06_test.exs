defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  @example "Time:      7  15   30
Distance:  9  40  200"

  # @tag :skip
  test "part1" do
    input = @example
    result = part1(input)

    assert result == 288
  end

  # @tag :skip
  test "part2" do
    input = @example
    result = part2(input)

    assert result == 71503
  end

  # @tag :skip
  test "full_part1" do
    input = AdventOfCode.Input.get!(6, 2023)
    result = part1(input)

    assert result == 393_120
  end

  # @tag :skip
  test "full_part2" do
    input = AdventOfCode.Input.get!(6, 2023)
    result = part2(input)

    assert result == 36_872_656
  end
end
