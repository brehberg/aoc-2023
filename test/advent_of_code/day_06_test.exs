defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  # @tag :skip
  test "part1" do
    input = "Time:      7  15   30
Distance:  9  40  200"
    result = part1(input)

    assert result == 288
  end

  # @tag :skip
  test "part2" do
    input = "Time:      7  15   30
Distance:  9  40  200"
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
